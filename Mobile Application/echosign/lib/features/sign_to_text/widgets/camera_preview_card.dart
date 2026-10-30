import 'package:camera/camera.dart';
import 'package:echosign/core/theme/app_color.dart';
import 'package:echosign/features/sign_to_text/widgets/camera_status.dart';
import 'package:echosign/features/sign_to_text/widgets/circle_button.dart';
import 'package:flutter/material.dart';

class CameraPreviewCard extends StatelessWidget {
  final CameraController? controller;
  final bool isLoading;
  final String? error;
  final VoidCallback? onOpenCamera;
  final VoidCallback? onSwitchCamera;
  final VoidCallback? onFlash;

  const CameraPreviewCard({
    super.key,
    this.controller,
    this.isLoading = false,
    this.error,
    this.onOpenCamera,
    this.onSwitchCamera,
    this.onFlash,
  });

  bool get _active => controller?.value.isInitialized ?? false;

  Widget _buildPreview() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_active) {
      final size = controller!.value.previewSize!;
      return SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: size.height,
            height: size.width,
            child: CameraPreview(controller!),
          ),
        ),
      );
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onOpenCamera,
            icon: const Icon(Icons.camera_alt_outlined),
            iconSize: 45,
          ),
          if (error != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                error!,
                style: const TextStyle(color: Colors.white70),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 600,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightLabPrimary,
          width: 1.5,
        ),
        gradient: LinearGradient(
          colors: isDark
              ? [
                  AppColors.darkLabPrimary,
                  AppColors.darkLabSecondary,
                  AppColors.darkLabDarkest,
                ]
              : [
                  AppColors.lightLabPrimary,
                  AppColors.lightLabSecondary,
                  AppColors.lightLabLightest,
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(child: _buildPreview()),
          Positioned(top: 18, left: 18, child: CameraStatus(active: _active)),
          Positioned(
            top: 18,
            right: 18,
            child: Row(
              children: [
                CircleButton(
                  icon: Icons.flip_camera_android,
                  onTap: onSwitchCamera,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
