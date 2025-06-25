
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_area_system/core/theme/app_colors.dart';

class TopBarButton extends StatelessWidget {
  const TopBarButton({
    super.key,
    required this.iconAsset,
    required this.onTap,
    this.tooltip,
  });

  final String iconAsset;
  final VoidCallback onTap;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip ?? '',
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        width: 30,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(4),
            backgroundColor: Colors.transparent,
            elevation: 0,
            shadowColor: Colors.transparent,
            side: BorderSide(color: AppColors.lightGrey),
          ),
          child: SvgPicture.asset(iconAsset, width: 20, height: 20),
        ),
      ),
    );
  }
}
