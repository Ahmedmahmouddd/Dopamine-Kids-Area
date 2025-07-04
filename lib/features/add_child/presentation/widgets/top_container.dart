import 'package:flutter/material.dart';
import 'package:kids_area_system/core/theme/app_colors.dart';
import 'package:kids_area_system/core/theme/app_text_styles.dart';
import 'package:kids_area_system/core/utils/app_constants.dart';
import 'package:kids_area_system/generated/l10n.dart';

class TopBorder extends StatelessWidget {
  const TopBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppConstants.largeRadius),
          topRight: Radius.circular(AppConstants.largeRadius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.extraLargePadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).enterNewChild, style: AppTextStyles.font20Red),
            const SizedBox(height: AppConstants.smallPadding),
            Text(
              S.of(context).enterNewChildDescription,
              style: AppTextStyles.font15Grey,
            ),
          ],
        ),
      ),
    );
  }
}
