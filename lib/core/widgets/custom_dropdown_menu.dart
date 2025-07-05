import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_area_system/core/theme/app_colors.dart';
import 'package:kids_area_system/core/theme/app_text_styles.dart';
import 'package:kids_area_system/core/utils/app_constants.dart';

class CustomDropdownField<T> extends StatelessWidget {
  const CustomDropdownField({
    super.key,
    required this.title,
    required this.hint,
    required this.items,
    required this.onChanged,
    this.value,
    this.image,
    this.validator,
  });

  final String title;
  final String hint;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  final String? image;
  final FormFieldValidator<T>? validator;
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.font14BlackMedium),
        const SizedBox(height: AppConstants.extraSmallPadding),
        SizedBox(
          // Add SizedBox to match TextFormField wrapper
          child: DropdownButtonFormField2<T>(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            isExpanded: true,
            value: value,
            items: items,
            validator: validator,
            onChanged: onChanged,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12, // Reduced from 14 to match TextField
                horizontal: 12,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 0,
                ),
                child: image != null
                    ? SvgPicture.asset(image!, color: AppColors.grey)
                    : null,
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 24,
                minHeight: 24,
              ),
              filled: true,
              fillColor: AppColors.white,
              hintText: hint,
              hintStyle: AppTextStyles.font14GreyRegular,
              isDense: true,
              constraints: const BoxConstraints(
                minHeight: 48, // Explicit height constraint
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppConstants.smallPadding),
                borderSide: BorderSide(color: AppColors.lightGrey, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppConstants.smallPadding),
                borderSide: BorderSide(color: AppColors.yellow, width: 2),
              ),
              errorStyle: AppTextStyles.font12RedSemiBold,
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
            iconStyleData: IconStyleData(
              icon: SvgPicture.asset(
                "assets/icons/arrow-down.svg",
                width: 16,
                height: 16,
                color: AppColors.grey,
              ),
              iconEnabledColor: AppColors.grey,
              iconDisabledColor: AppColors.grey,
            ),
            style: AppTextStyles.font14BlackMedium,
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppConstants.basePadding),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 10,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(height: 40),
            hint: Text(hint, style: AppTextStyles.font14GreyRegular),
          ),
        ),
      ],
    );
  }
}
