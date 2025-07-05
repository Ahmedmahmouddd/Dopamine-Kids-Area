import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids_area_system/core/theme/app_colors.dart';
import 'package:kids_area_system/core/theme/app_text_styles.dart';
import 'package:kids_area_system/core/utils/app_constants.dart';
import 'package:kids_area_system/generated/l10n.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 24.0,
            ),
            child: Row(
              spacing: 24,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InfoCardWithIcon(
                  title: S.of(context).totalSessions,
                  value: '24 ${S.of(context).sessions}',
                  iconColor: AppColors.purple,
                  iconPath: 'assets/icons/total-sessions.svg',
                  showStatistics: true,
                ),
                InfoCardWithIcon(
                  title: S.of(context).totalPoints,
                  value: '12500 ${S.of(context).points}',
                  iconPath: 'assets/icons/point.svg',
                  iconColor: AppColors.red,
                  showStatistics: true,
                ),
                InfoCardWithIcon(
                  title: S.of(context).totalRevenue,
                  value: '3700 ${S.of(context).le}',
                  iconPath: 'assets/icons/wallet.svg',
                  iconColor: AppColors.yellow,
                  showStatistics: true,
                ),
                InfoCardWithIcon(
                  title: S.of(context).totalHours,
                  value: '93 ${S.of(context).hours}',
                  iconPath: 'assets/icons/total-hours.svg',
                  iconColor: AppColors.orange,
                  showStatistics: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
              blurRadius: 10,
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
