import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:kids_area_system/core/helpers/helpers.dart';
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
  });

  final String title;
  final String hint;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  final String? image; // 🆕 SVG path for prefix icon

  @override
  Widget build(BuildContext context) {
    final selectedItem = items.firstWhere(
      (item) => item.value == value,
      orElse: () => DropdownMenuItem<T>(
        value: null,
        child: Text(hint, style: AppTextStyles.font14Grey),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.font14Black),
        const SizedBox(height: AppConstants.extraSmallPadding),
        DropdownButtonHideUnderline(
          child: DropdownButton2<T>(
            isExpanded: true,
            value: value,
            items: items,
            onChanged: onChanged,
            style: AppTextStyles.font14Black,
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppConstants.basePadding),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              elevation: 3,
              padding: EdgeInsets.zero,
            ),
            menuItemStyleData: const MenuItemStyleData(height: 40),
            customButton: Container(
              height: 40,
              // padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.lightGrey, width: 2),
                borderRadius: BorderRadius.circular(AppConstants.basePadding),
              ),
              child: Row(
                spacing: 12,
                children: [
                  if (image != null)
                    Padding(
                      padding: EdgeInsets.only(
                        right: isLanguageArabic()
                            ? AppConstants.basePadding
                            : 0,
                        left: isLanguageArabic() ? 0 : AppConstants.basePadding,
                      ),
                      child: SvgPicture.asset(
                        image!,
                        height: AppConstants.smallIconSize,
                        color: AppColors.grey,
                      ),
                    ),
                  Expanded(
                    child: Text(
                      value != null
                          ? (selectedItem.child as Text).data ?? ''
                          : hint,
                      style: value != null
                          ? AppTextStyles.font14Black
                          : AppTextStyles.font14Grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: isLanguageArabic() ? 0 : AppConstants.basePadding,
                      left: isLanguageArabic() ? AppConstants.basePadding : 0,
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/arrow-down.svg",
                      width: 16,
                      height: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
