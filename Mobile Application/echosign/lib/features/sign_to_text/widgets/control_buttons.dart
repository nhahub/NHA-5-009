import 'package:echosign/features/sign_to_text/widgets/control_button.dart';
import 'package:flutter/material.dart';


class ControlButtons extends StatelessWidget {
  final VoidCallback? onPause;
  final VoidCallback? onStop;
  final VoidCallback? onClear;

  const ControlButtons({
    super.key,
    this.onPause,
    this.onStop,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ControlButton(
            icon: Icons.pause,
            label: 'Pause',
            onTap: onPause,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ControlButton(
            icon: Icons.stop_outlined,
            label: 'Stop',
            onTap: onStop,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ControlButton(
            icon: Icons.backspace_outlined,
            label: 'Clear',
            onTap: onClear,
          ),
        ),
      ],
    );
  }
}

