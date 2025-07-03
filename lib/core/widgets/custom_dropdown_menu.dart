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
  });

  final String title;
  final String hint;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.font14Black),
        const SizedBox(height: AppConstants.extraSmallPadding),
        DropdownButtonHideUnderline(
          child: DropdownButton2<T>(
            isExpanded: true,
            value: value,
            hint: Text(hint, style: AppTextStyles.font14Grey),
            items: items,
            onChanged: onChanged,
            iconStyleData: IconStyleData(
              icon: SvgPicture.asset("assets/icons/dropdown_arrow.svg"),
            ),
            buttonStyleData: ButtonStyleData(
              height: 38,
              padding: EdgeInsets.only(
                right: isLanguageArabic() ? 0 : AppConstants.extraSmallPadding,

                left: isLanguageArabic() ? AppConstants.extraSmallPadding : 0,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.lightGrey, width: 2),
                borderRadius: BorderRadius.circular(AppConstants.basePadding),
              ),
            ),
            menuItemStyleData: MenuItemStyleData(height: 38),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppConstants.basePadding),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              elevation: 2,
              padding: EdgeInsets.zero,
            ),
            style: AppTextStyles.font14Black,
          ),
        ),
      ],
    );
  }
}
