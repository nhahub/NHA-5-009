import 'package:echosign/core/theme/app_color.dart';
import 'package:echosign/features/settings/widgets/setting_icons.dart';
import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark; 

    return InkWell(
      onTap: onTap,                                    
      borderRadius: BorderRadius.circular(24),          
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 26, vertical: 18), 
        child: Row(
          children: [
            SettingIcons(icon: icon),                   
            SizedBox(width: 20),                  
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                      fontSize: 17,                     
                      fontWeight: FontWeight.w600,       
                    ),
                  ),
                  if (subtitle != null) ...[
                    SizedBox(height: 4),           
                    Text(
                      subtitle!,
                      style: TextStyle(
                        color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary, 
                        fontSize: 14,                     
                        height: 1.3,                      
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (trailing != null)
              trailing!                                 
            else
              Icon(
                Icons.chevron_right_rounded,
                color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary, 
                size: 28,                                 
              ),
          ],
        ),
      ),
    );
  }
}