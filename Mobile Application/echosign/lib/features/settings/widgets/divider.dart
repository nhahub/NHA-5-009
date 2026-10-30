import 'package:echosign/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return  Divider(
      height: 1,
      thickness: 1,
      color: AppColors.darkBorder,
      indent: 0,
      endIndent: 0,
    );
  }
}