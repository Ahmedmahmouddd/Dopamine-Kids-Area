import 'package:flutter/material.dart';
import 'package:kids_area_system/core/theme/app_colors.dart';
import 'package:kids_area_system/core/utils/app_constants.dart';
import 'package:kids_area_system/core/widgets/custom_button.dart';
import 'package:kids_area_system/generated/l10n.dart';

class BottomBorder extends StatelessWidget {
  const BottomBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppConstants.mediumPadding,
        horizontal: AppConstants.mediumPadding,
      ),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppConstants.mediumPadding),
          bottomRight: Radius.circular(AppConstants.mediumPadding),
        ),
      ),
      child: Row(
        spacing: AppConstants.smallPadding,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            overlayColor: AppColors.secondayOverlayColor,
            backgroundColor: AppColors.white,
            onPressed: () {},
            text: S.of(context).resetForm,
            imageAsset: "assets/icons/reset.svg",
          ),
          CustomButton(
            // width: 200,
            textColor: AppColors.white,
            imageColor: AppColors.white,
            backgroundColor: AppColors.red,
            onPressed: () {},
            text: S.of(context).addChildAndPrintReset,
            imageAsset: "assets/icons/print.svg",
          ),
        ],
      ),
    );
  }
}
