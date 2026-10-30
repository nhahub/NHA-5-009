import 'package:camera/camera.dart';
import 'package:echosign/core/theme/app_color.dart';
import 'package:echosign/features/settings/setting_screen.dart';
import 'package:echosign/features/sign_to_text/widgets/camera_preview_card.dart';
import 'package:echosign/features/sign_to_text/widgets/control_buttons.dart';
import 'package:echosign/features/sign_to_text/widgets/translating_button.dart';
import 'package:echosign/features/sign_to_text/widgets/translation_result_card.dart';
import 'package:flutter/material.dart';

class SignToTextScreen extends StatefulWidget {
  const SignToTextScreen({super.key});

  @override
  State<SignToTextScreen> createState() => _SignToTextScreenState();
}

class _SignToTextScreenState extends State<SignToTextScreen>
    with WidgetsBindingObserver {
  CameraController? _controller;
  List<CameraDescription> _cameras = [];
  int _cameraIndex = 0;

  bool _loading = false;
  bool _flashOn = false;
  bool isTranslating = false;
  String? _error;

  String _englishText = '';
  String _arabicText = '';
  double _confidence = 0;

  bool _processing = false;
  DateTime _lastFrame = DateTime.fromMillisecondsSinceEpoch(0);

  bool get _cameraReady => _controller?.value.isInitialized ?? false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      _releaseCamera();
    }
  }

  // ---------------- Camera ----------------

  Future<void> _startCamera([int? index]) async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      if (_cameras.isEmpty) _cameras = await availableCameras();
      if (_cameras.isEmpty) {
        _error = 'No camera found';
        return;
      }

      _cameraIndex = index ?? _cameraIndex;
      await _controller?.dispose();

      final controller = CameraController(
        _cameras[_cameraIndex],
        ResolutionPreset.medium,
        enableAudio: false,
      );
      _controller = controller;
      await controller.initialize();
      _flashOn = false;
    } on CameraException catch (e) {
      _controller = null;
      _error = e.code == 'CameraAccessDenied'
          ? 'Camera permission denied'
          : 'Camera error: ${e.description}';
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _releaseCamera() async {
    final controller = _controller;
    _controller = null;
    isTranslating = false;
    if (mounted) setState(() {});
    if (controller != null) {
      if (controller.value.isStreamingImages) {
        await controller.stopImageStream();
      }
      await controller.dispose();
    }
  }

  Future<void> _switchCamera() async {
    if (_cameras.length < 2) return;
    final wasTranslating = isTranslating;

    await _stopStream();
    await _startCamera((_cameraIndex + 1) % _cameras.length);

    if (wasTranslating && _cameraReady) await _startStream();
  }

  // ---------------- Stream / Translation ----------------

  Future<void> _startStream() async {
    final controller = _controller;
    if (controller == null || controller.value.isStreamingImages) return;
    await controller.startImageStream(_onFrame);
    if (mounted) setState(() => isTranslating = true);
  }

  Future<void> _stopStream() async {
    final controller = _controller;
    if (controller != null && controller.value.isStreamingImages) {
      await controller.stopImageStream();
    }
  }

  Future<void> _onFrame(CameraImage image) async {
    final now = DateTime.now();
    if (_processing || now.difference(_lastFrame).inMilliseconds < 300) {
      return;
    }
    _processing = true;
    _lastFrame = now;

    try {
      // final result = await model.predict(image);
      // if (!mounted) return;
      // setState(() {
      //   _englishText = result.english;
      //   _arabicText = result.arabic;
      //   _confidence = result.confidence;
      // });
    } finally {
      _processing = false;
    }
  }

  // ---------------- Buttons ----------------

  Future<void> _onMainButtonTap() async {
    if (isTranslating) {
      await _pause();
      return;
    }
    if (!_cameraReady) await _startCamera();
    if (_cameraReady) await _startStream();
  }

  Future<void> _pause() async {
    await _stopStream();
    if (mounted) setState(() => isTranslating = false);
  }

  Future<void> _stop() async {
    await _releaseCamera();
  }

  void _clear() {
    setState(() {
      _englishText = '';
      _arabicText = '';
      _confidence = 0;
    });
  }

  // ---------------- UI ----------------

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.west),
        ),
        title: Row(
          children: [
            Image.asset('assets/images/logo.png', width: 60, height: 60),
            const SizedBox(width: 10),
            Text(
              'EchoSign',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: isDark ? AppColors.cyan : AppColors.tealDark,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const SettingScreen(),
                ),
              );
            },
            icon: const Icon(Icons.settings),
            iconSize: 25,
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    CameraPreviewCard(
                      controller: _controller,
                      isLoading: _loading,
                      error: _error,
                      onOpenCamera: _startCamera,
                      onSwitchCamera: _switchCamera,
                    ),
                    const SizedBox(height: 16),
                    TranslationResultCard(
                      englishText: _englishText,
                      arabicText: _arabicText,
                      confidence: _confidence,
                    ),
                    const SizedBox(height: 20),
                    TranslatingButton(
                      isTranslating: isTranslating,
                      onTap: _onMainButtonTap,
                    ),
                    const SizedBox(height: 16),
                    ControlButtons(
                      onPause: _pause,
                      onStop: _stop,
                      onClear: _clear,
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}