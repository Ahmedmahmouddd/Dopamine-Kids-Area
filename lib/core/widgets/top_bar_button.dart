import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_area_system/core/theme/app_colors.dart';
import 'package:kids_area_system/core/utils/app_constants.dart';

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
        borderRadius: BorderRadius.circular(AppConstants.mediumRadius),
      ),
      child: SizedBox(
        width: 30,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(AppConstants.extraSmallPadding),
            backgroundColor: Colors.transparent,
            elevation: 0,
            shadowColor: Colors.transparent,
            side: BorderSide(color: AppColors.lightGrey),
          ),
          child: SvgPicture.asset(
            iconAsset,
            width: AppConstants.smallIconSize,
            height: AppConstants.smallIconSize,
          ),
        ),
      ),
    );
  }
}
