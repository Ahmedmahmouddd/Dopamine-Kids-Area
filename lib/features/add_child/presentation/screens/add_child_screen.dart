import 'dart:developer';

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

class AddChildScreen extends StatefulWidget {
  const AddChildScreen({super.key});

  @override
  State<AddChildScreen> createState() => _AddChildScreenState();
}

class _AddChildScreenState extends State<AddChildScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final idController = TextEditingController();
  final phone1Controller = TextEditingController();
  final phone2Controller = TextEditingController();
  final pointsController = TextEditingController();
  final currentTimeController = TextEditingController();

  String? selectedDuration;
  String? selectedChildrenCount = '1';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    idController.dispose();
    phone1Controller.dispose();
    phone2Controller.dispose();
    pointsController.dispose();
    currentTimeController.dispose();
    super.dispose();
  }

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
                    BlocProvider(
                      create: (context) => AddChildCubit(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(color: AppColors.white),
                        ),
                        child: Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 32),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 32,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: CustomTextField(
                                          validator: (value) =>
                                              AddChildCubit.validateName(
                                                value,
                                                context,
                                              ),
                                          controller: nameController,
                                          title: S.of(context).childName,
                                          hint: S
                                              .of(context)
                                              .childNameOfGroupName,
                                          image: 'assets/icons/profile.svg',
                                        ),
                                      ),
                                      SizedBox(width: 40),
                                      Expanded(
                                        child: CustomTextField(
                                          validator: (value) =>
                                              AddChildCubit.validateId(
                                                value,
                                                context,
                                              ),

                                          controller: idController,
                                          title: S.of(context).entryID,
                                          hint: S.of(context).enterChildId,
                                          image: 'assets/icons/id.svg',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 24),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppConstants.extraLargePadding,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: CustomTextField(
                                          validator: (value) =>
                                              AddChildCubit.validatePrimaryPhone(
                                                value,
                                                context,
                                              ),
                                          controller: phone1Controller,
                                          title: S
                                              .of(context)
                                              .primaryPhoneNumber,
                                          hint: S.of(context).parentPhoneNumber,
                                          image: 'assets/icons/call.svg',
                                        ),
                                      ),
                                      SizedBox(width: 40),
                                      Expanded(
                                        child: CustomTextField(
                                          validator: (value) =>
                                              AddChildCubit.validateSecondaryPhone(
                                                value,
                                                context,
                                              ),
                                          controller: phone2Controller,
                                          title: S
                                              .of(context)
                                              .secondaryPhoneNumber,
                                          hint: S
                                              .of(context)
                                              .parentSecondaryPhoneNumberOptional,
                                          image: 'assets/icons/call-add.svg',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 24),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppConstants.extraLargePadding,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: CustomDropdownField(
                                          validator: (value) =>
                                              AddChildCubit.validateSessionDuration(
                                                value,
                                                context,
                                              ),
                                          image: 'assets/icons/clock.svg',
                                          title: S.of(context).sessionDuration,
                                          hint: S.of(context).selectDuration,
                                          value: selectedDuration,
                                          items: [
                                            DropdownMenuItem(
                                              value: '30',
                                              child: Text(
                                                S.of(context).minutes30,
                                              ),
                                            ),
                                            DropdownMenuItem(
                                              value: '60',
                                              child: Text(
                                                S.of(context).minutes60,
                                              ),
                                            ),
                                            DropdownMenuItem(
                                              value: '90',
                                              child: Text(
                                                S.of(context).minutes90,
                                              ),
                                            ),
                                            DropdownMenuItem(
                                              value: '120',
                                              child: Text(
                                                S.of(context).minutes120,
                                              ),
                                            ),
                                            DropdownMenuItem(
                                              value: '150',
                                              child: Text(
                                                S.of(context).minutes150,
                                              ),
                                            ),
                                            DropdownMenuItem(
                                              value: '180',
                                              child: Text(
                                                S.of(context).minutes180,
                                              ),
                                            ),
                                            DropdownMenuItem(
                                              value: 'open',
                                              child: Text(
                                                S.of(context).openTime,
                                              ),
                                            ),
                                          ],
                                          onChanged: (value) {
                                            setState(() {
                                              selectedDuration = value;
                                            });
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 40),
                                      Expanded(
                                        child: CustomDropdownField(
                                          image: 'assets/icons/people.svg',
                                          title: S.of(context).numberOfChildren,
                                          hint: S.of(context).selectNumber,
                                          value: selectedChildrenCount,
                                          items: [
                                            DropdownMenuItem(
                                              value: '1',
                                              child: Text('1'),
                                            ),
                                            DropdownMenuItem(
                                              value: '2',
                                              child: Text('2'),
                                            ),
                                            DropdownMenuItem(
                                              value: '3',
                                              child: Text('3'),
                                            ),
                                            DropdownMenuItem(
                                              value: '4',
                                              child: Text('4'),
                                            ),
                                            DropdownMenuItem(
                                              value: '5',
                                              child: Text('5'),
                                            ),
                                            DropdownMenuItem(
                                              value: '6',
                                              child: Text('6'),
                                            ),
                                          ],
                                          onChanged: (value) {
                                            setState(() {
                                              selectedChildrenCount = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 24),
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
                                          controller: TextEditingController(),
                                          title: S.of(context).totalPoints,
                                          hint: S.of(context).totalPoints,
                                          image: 'assets/icons/point.svg',
                                        ),
                                      ),
                                      SizedBox(width: 40),
                                      Expanded(
                                        child: CustomTextField(
                                          fillColor: AppColors.lightGrey,
                                          enabled: false,
                                          controller: TextEditingController(),
                                          title: S.of(context).currentTime,
                                          hint: DateTime.now().toString(),
                                          image: 'assets/icons/clock.svg',
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
                    ),
                    BottomBorder(
                      addChildButton: () {
                        if (_formKey.currentState!.validate()) {
                          log('Child Name: ${nameController.text.trim()}');
                          log('Entry ID: ${idController.text.trim()}');
                          log('Primary Phone: ${phone1Controller.text.trim()}');
                          log(
                            'Secondary Phone: ${phone2Controller.text.trim()}',
                          );
                          log('Session Duration: $selectedDuration');
                          log('Number of Children: $selectedChildrenCount');
                        }
                      },
                      resetFormButton: () {},
                    ),
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
