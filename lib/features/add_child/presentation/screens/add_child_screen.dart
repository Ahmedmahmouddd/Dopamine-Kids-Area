import 'package:flutter/material.dart';
import 'package:kids_area_system/core/theme/app_colors.dart';
import 'package:kids_area_system/core/utils/app_constants.dart';
import 'package:kids_area_system/core/widgets/custom_text_field.dart';
import 'package:kids_area_system/features/add_child/presentation/widgets/bottom_container.dart';
import 'package:kids_area_system/features/add_child/presentation/widgets/top_container.dart';
import 'package:kids_area_system/generated/l10n.dart';

class AddChildScreen extends StatelessWidget {
  const AddChildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Spacer(flex: 3),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    TopBorder(),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(color: AppColors.white),
                      ),
                      child: Form(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: CustomTextField(
                                        controller: TextEditingController(),
                                        title: S.of(context).childName,
                                        hint: S
                                            .of(context)
                                            .childNameOfGroupName,
                                        image: 'assets/icons/child.svg',
                                      ),
                                    ),
                                    SizedBox(width: AppConstants.largePadding),
                                    Expanded(
                                      child: CustomTextField(
                                        controller: TextEditingController(),
                                        title: S.of(context).entryID,
                                        hint: S.of(context).enterChildId,
                                        image: 'assets/icons/id1.svg',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: AppConstants.largePadding),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppConstants.extraLargePadding,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: CustomTextField(
                                        controller: TextEditingController(),
                                        title: S.of(context).primaryPhoneNumber,
                                        hint: S.of(context).parentPhoneNumber,
                                        image: 'assets/icons/phone1.svg',
                                      ),
                                    ),
                                    SizedBox(width: AppConstants.largePadding),
                                    Expanded(
                                      child: CustomTextField(
                                        controller: TextEditingController(),
                                        title: S
                                            .of(context)
                                            .secondaryPhoneNumber,
                                        hint: S
                                            .of(context)
                                            .parentSecondaryPhoneNumberOptional,
                                        image: 'assets/icons/phone2.svg',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    BottomBorder(),
                  ],
                ),
              ),
              Spacer(flex: 3),
            ],
          ),
        ],
      ),
    );
  }
}
