import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_area_system/core/theme/app_colors.dart';
import 'package:kids_area_system/core/theme/app_text_styles.dart';
import 'package:kids_area_system/core/utils/app_constants.dart';

class InfoCardWithIcon extends StatelessWidget {
  const InfoCardWithIcon({
    super.key,
    required this.title,
    required this.value,
    required this.iconPath,
    required this.iconColor,
    required this.showStatistics,
  });

  final String title;
  final String value;
  final String iconPath;
  final Color iconColor;
  final bool showStatistics;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppConstants.largePadding),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppConstants.largeRadius),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: 8,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title, style: AppTextStyles.font14GreyMedium),
                    Text(value, style: AppTextStyles.font20BlackSemiBold),
                  ],
                ),
                Spacer(),
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: iconColor,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(AppConstants.basePadding),
                    child: SvgPicture.asset(iconPath, color: AppColors.white),
                  ),
                ),
              ],
            ),
            if (!showStatistics)
              Text("Today Only", style: AppTextStyles.font14BlackSemiBold),
            if (showStatistics) ...[
              SizedBox(height: AppConstants.smallPadding),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightGreen,
                      borderRadius: BorderRadius.circular(
                        AppConstants.smallRadius,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.smallPadding,
                        vertical: AppConstants.extraSmallPadding,
                      ),
                      child: Text("+10%", style: AppTextStyles.font11GreenBold),
                    ),
                  ),
                  SizedBox(width: AppConstants.smallPadding),
                  Text(
                    "Since Last Week",
                    style: AppTextStyles.font11GreyMedium,
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
