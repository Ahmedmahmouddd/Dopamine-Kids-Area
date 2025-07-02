import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_area_system/core/theme/app_colors.dart';
import 'package:kids_area_system/core/theme/app_text_styles.dart';
import 'package:kids_area_system/core/utils/app_constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.onChanged,
    required this.title,
    required this.hint,
    required this.image,
  });

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String title, hint, image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.horizontalPadding,
      ),
      child: Column(
        spacing: AppConstants.extraSmallPadding,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.font14Black),
          SizedBox(
            height: 38,
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
              cursorColor: AppColors.yellow,
              cursorWidth: 2,
              style: AppTextStyles.font14Black,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(
                    top: AppConstants.smallPadding,
                    bottom: AppConstants.smallPadding,
                  ),
                  child: SvgPicture.asset(image),
                ),
                fillColor: AppColors.white,
                hintText: hint,
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.mediumPadding,
                ),
                hintStyle: AppTextStyles.font14Grey,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.lightGrey, width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppConstants.basePadding),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.yellow, width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppConstants.basePadding),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
