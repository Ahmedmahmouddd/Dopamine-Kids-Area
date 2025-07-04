import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_area_system/core/theme/app_colors.dart';
import 'package:kids_area_system/core/utils/app_constants.dart';
import 'package:kids_area_system/core/widgets/custom_dropdown_menu.dart';
import 'package:kids_area_system/core/widgets/custom_text_field.dart';
import 'package:kids_area_system/features/add_child/presentation/cubit/add_child_cubit/add_child_cubit.dart';
import 'package:kids_area_system/features/add_child/presentation/widgets/bottom_container.dart';
import 'package:kids_area_system/features/add_child/presentation/widgets/top_container.dart';
import 'package:kids_area_system/generated/l10n.dart';

class AddChildScreen extends StatelessWidget {
  const AddChildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddChildCubit(),
      child: Scaffold(body: AddChildFormContent()),
    );
  }
}

class AddChildFormContent extends StatelessWidget {
  const AddChildFormContent({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddChildCubit>();
    final s = S.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            const Spacer(flex: 3),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  const TopBorder(),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.white),
                    ),
                    child: Form(
                      key: cubit.formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 32),
                        child: Column(
                          spacing: AppConstants.largePadding,
                          children: [
                            // Name and ID Row
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      validator: (value) =>
                                          cubit.validateName(value, context),
                                      controller: cubit.nameController,
                                      title: s.childName,
                                      hint: s.childNameOfGroupName,
                                      image: 'assets/icons/profile.svg',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: AppConstants.horizontalPadding,
                                  ),
                                  Expanded(
                                    child: CustomTextField(
                                      validator: (value) =>
                                          cubit.validateId(value, context),
                                      controller: cubit.idController,
                                      title: s.entryID,
                                      hint: s.enterChildId,
                                      image: 'assets/icons/id.svg',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Phone Numbers Row
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppConstants.extraLargePadding,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      validator: (value) =>
                                          cubit.validatePhone1(value, context),
                                      controller: cubit.phone1Controller,
                                      title: s.primaryPhoneNumber,
                                      hint: s.parentPhoneNumber,
                                      image: 'assets/icons/call.svg',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: AppConstants.horizontalPadding,
                                  ),
                                  Expanded(
                                    child: CustomTextField(
                                      validator: (value) =>
                                          cubit.validatePhone2(value, context),
                                      controller: cubit.phone2Controller,
                                      title: s.secondaryPhoneNumber,
                                      hint:
                                          s.parentSecondaryPhoneNumberOptional,
                                      image: 'assets/icons/call-add.svg',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Dropdowns Row
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppConstants.extraLargePadding,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child:
                                        BlocBuilder<
                                          AddChildCubit,
                                          AddChildState
                                        >(
                                          builder: (context, state) {
                                            return CustomDropdownField(
                                              validator: (value) =>
                                                  cubit.validateSessionDuration(
                                                    value,
                                                    context,
                                                  ),
                                              image: 'assets/icons/clock.svg',
                                              title: s.sessionDuration,
                                              hint: s.selectDuration,
                                              value: cubit.selectedDuration,
                                              items: cubit.sessionDurations(
                                                context,
                                              ),
                                              onChanged:
                                                  cubit.updateSelectedDuration,
                                            );
                                          },
                                        ),
                                  ),
                                  const SizedBox(
                                    width: AppConstants.horizontalPadding,
                                  ),
                                  Expanded(
                                    child:
                                        BlocBuilder<
                                          AddChildCubit,
                                          AddChildState
                                        >(
                                          builder: (context, state) {
                                            return CustomDropdownField(
                                              image: 'assets/icons/people.svg',
                                              title: s.numberOfChildren,
                                              hint: s.selectNumber,
                                              value:
                                                  cubit.selectedChildrenCount,
                                              items: cubit.childrenCount,
                                              onChanged:
                                                  cubit.updateChildrenCount,
                                            );
                                          },
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            // Points and Time Row
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppConstants.extraLargePadding,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      fillColor: AppColors.lightGrey,
                                      enabled: false,
                                      controller: cubit.pointsController,
                                      title: s.totalPoints,
                                      hint: s.totalPoints,
                                      image: 'assets/icons/point.svg',
                                    ),
                                  ),
                                  const SizedBox(width: 40),
                                  Expanded(
                                    child:
                                        BlocBuilder<
                                          AddChildCubit,
                                          AddChildState
                                        >(
                                          builder: (context, state) {
                                            return CustomTextField(
                                              fillColor: AppColors.lightGrey,
                                              enabled: false,
                                              controller: context
                                                  .read<AddChildCubit>()
                                                  .currentTimeController,
                                              title: s.currentTime,
                                              hint: s.currentTime,
                                              image: 'assets/icons/clock.svg',
                                            );
                                          },
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
                  BottomBorder(
                    addChildButton: cubit.addChild,
                    resetFormButton: cubit.resetForm,
                  ),
                ],
              ),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ],
    );
  }
}
