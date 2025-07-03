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
    this.readOnly, this.fillColor,
  });

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String title, hint, image;
  final bool? readOnly;
  final Color? fillColor; 
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppConstants.smallPadding,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.font14Black),
        SizedBox(
          height: 40,
          child: TextFormField(
            readOnly: readOnly ?? false,
            controller: controller,
            onChanged: onChanged,
            cursorColor: AppColors.yellow,
            cursorWidth: 2,
            style: AppTextStyles.font14Black,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SvgPicture.asset(image, color: AppColors.grey),
              ),
              fillColor: fillColor ??  AppColors.white ,
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
              focusedBorder: OutlineInputBorder(
                borderSide: readOnly == true
                    ? BorderSide(color: AppColors.lightGrey, width: 2)
                    : BorderSide(color: AppColors.yellow, width: 2),
                borderRadius: BorderRadius.all(
                  Radius.circular(AppConstants.basePadding),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
