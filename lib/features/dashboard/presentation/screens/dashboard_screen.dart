import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids_area_system/core/theme/app_colors.dart';
import 'package:kids_area_system/core/theme/app_text_styles.dart';
import 'package:kids_area_system/core/utils/app_constants.dart';

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
                InfoCardWithIcon(),
                InfoCardWithIcon(),
                InfoCardWithIcon(),
                InfoCardWithIcon(),
                InfoCardWithIcon(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoCardWithIcon extends StatelessWidget {
  const InfoCardWithIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppConstants.largePadding),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppConstants.largeRadius),
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
                    Text(
                      "Total Sessions",
                      style: AppTextStyles.font14GreyMedium,
                    ),
                    Text(
                      "25 Sessions",
                      style: AppTextStyles.font20BlackSemiBold,
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: AppColors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(AppConstants.basePadding),
                    child: SvgPicture.asset(
                      "assets/icons/id.svg",
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
            Text("Today Only", style: AppTextStyles.font14BlackSemiBold),
          ],
        ),
      ),
    );
  }
}
