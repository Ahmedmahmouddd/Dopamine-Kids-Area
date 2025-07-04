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
    this.enabled,
    this.fillColor,
    this.validator,
  });

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String title, hint, image;
  final bool? enabled;
  final Color? fillColor;
  final FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.font14Black),
        const SizedBox(height: AppConstants.smallPadding),
        SizedBox(
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            onChanged: onChanged,
            enabled: enabled ?? true,
            validator: validator,
            cursorColor: AppColors.yellow,
            cursorWidth: 2,
            style: AppTextStyles.font14Black,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 0,
                ),
                child: SvgPicture.asset(image, color: AppColors.grey),
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 24,
                minHeight: 24,
              ),
              fillColor: fillColor ?? AppColors.white,
              hintText: hint,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 12,
              ),
              hintStyle: AppTextStyles.font14Grey,
              isDense: true,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.lightGrey, width: 2),
                borderRadius: BorderRadius.all(
                  Radius.circular(AppConstants.smallPadding),
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.lightGrey, width: 2),
                borderRadius: BorderRadius.all(
                  Radius.circular(AppConstants.smallPadding),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: enabled == true
                      ? AppColors.lightGrey
                      : AppColors.yellow,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(AppConstants.smallPadding),
                ),
              ),
              errorStyle: AppTextStyles.font12Red,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppConstants.smallPadding),
                borderSide: BorderSide(
                  color: AppColors.red.withAlpha(100),
                  width: 2,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppConstants.smallPadding),
                borderSide: BorderSide(
                  color: AppColors.red.withAlpha(160),
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
