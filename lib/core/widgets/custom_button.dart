import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_area_system/core/theme/app_colors.dart';
import 'package:kids_area_system/core/theme/app_text_styles.dart';
import 'package:kids_area_system/core/utils/app_constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.width,
    this.textColor,
    this.backgroundColor,
    required this.onPressed,
    required this.text,
    this.imageAsset,
    this.imageColor,
    this.overlayColor,
  });

  final double? width;
  final String text;
  final Color? textColor;
  final Color? imageColor;
  final Color? backgroundColor;
  final Function() onPressed;
  final String? imageAsset;
  final Color? overlayColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      // width: width ?? 120,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(backgroundColor),
          overlayColor: WidgetStateProperty.all(
            overlayColor ?? AppColors.overlayColor,
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          elevation: WidgetStateProperty.all(0),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageAsset != null
                ? SvgPicture.asset(
                    imageAsset!,
                    color: imageColor ?? AppColors.black,
                    width: AppConstants.extraSmallIconSize,
                  )
                : const SizedBox.shrink(),
            SizedBox(
              width: imageAsset != null ? AppConstants.extraSmallPadding : 0,
            ),
            Baseline(
              baseline: 15,
              baselineType: TextBaseline.alphabetic,
              child: Text(
                text,
                style: AppTextStyles.font14Black.copyWith(color: textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
