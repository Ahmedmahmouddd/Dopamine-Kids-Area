import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kids_area_system/core/helpers/helpers.dart';
import 'package:kids_area_system/generated/l10n.dart';

part 'add_child_state.dart';

class AddChildCubit extends Cubit<AddChildState> {
  AddChildCubit() : super(AddChildInitial()) {
    _initTimeUpdates(); // Initialize time updates when cubit is created
  }

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final idController = TextEditingController();
  final phone1Controller = TextEditingController();
  final phone2Controller = TextEditingController();
  final pointsController = TextEditingController();
  final currentTimeController = TextEditingController();

  String? selectedDuration;
  String selectedChildrenCount = '1';
  Timer? timeTimer;

  void dispose() {
    nameController.dispose();
    idController.dispose();
    phone1Controller.dispose();
    phone2Controller.dispose();
    pointsController.dispose();
    currentTimeController.dispose();
  }

  // Validation methods
  String? validateName(String? value, BuildContext context) {
    if (value == null || value.isEmpty) return S.of(context).nameRequired;
    return null;
  }

  String? validateId(String? value, BuildContext context) {
    if (value == null || value.isEmpty) return S.of(context).entryIdRequired;
    return null;
  }

  String? validatePhone1(String? value, BuildContext context) {
    if (value == null || value.isEmpty) return S.of(context).phoneRequired;
    if (!RegExp(r'^[0-9]+$').hasMatch(value.trim())) {
      return S.of(context).phoneMustContainOnlyNumbers;
    }
    if (value.trim().length != 11) return S.of(context).phoneMustBe11Digits;
    return null;
  }

  String? validatePhone2(String? value, BuildContext context) {
    if (value != null && value.isNotEmpty) {
      if (!RegExp(r'^[0-9]+$').hasMatch(value.trim())) {
        return S.of(context).phoneMustContainOnlyNumbers;
      }
      if (value.trim().length != 11) return S.of(context).phoneMustBe11Digits;
    }
    return null;
  }

  String? validateSessionDuration(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).sessionDurationRequired;
    }
    return null;
  }

  // Dropdown items
  List<DropdownMenuItem<String>> get childrenCount => [
    for (var i = 1; i <= 6; i++)
      DropdownMenuItem(value: i.toString(), child: Text(i.toString())),
  ];

  List<DropdownMenuItem<String>> sessionDurations(BuildContext context) => [
    DropdownMenuItem(value: '30', child: Text(S.of(context).minutes30)),
    DropdownMenuItem(value: '60', child: Text(S.of(context).minutes60)),
    DropdownMenuItem(value: '90', child: Text(S.of(context).minutes90)),
    DropdownMenuItem(value: '120', child: Text(S.of(context).minutes120)),
    DropdownMenuItem(value: '150', child: Text(S.of(context).minutes150)),
    DropdownMenuItem(value: '180', child: Text(S.of(context).minutes180)),
    DropdownMenuItem(value: 'open', child: Text(S.of(context).openTime)),
  ];

  void resetForm() {
    nameController.clear();
    idController.clear();
    phone1Controller.clear();
    phone2Controller.clear();
    pointsController.clear();
    currentTimeController.clear();
    emit(AddChildInitial());
    formKey.currentState?.reset();
  }

  void addChild() {
    if (formKey.currentState!.validate()) {
      log('Child Name: ${nameController.text.trim()}');
      log('Entry ID: ${idController.text.trim()}');
      log('Primary Phone: ${phone1Controller.text.trim()}');
      log('Secondary Phone: ${phone2Controller.text.trim()}');
      log('Session Duration: $selectedDuration');
      log('Number of Children: $selectedChildrenCount');
    }
  }

  void updateSelectedDuration(String? value) {
    selectedDuration = value;
    emit(AddChildState()); // Rebuild listeners
  }

  void updateChildrenCount(String? value) {
    selectedChildrenCount = value ?? '1';
    emit(AddChildState()); // Rebuild listeners
  }

  void _initTimeUpdates() {
    // Update immediately
    _updateTimeDisplay();

    // Update every minute
    timeTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      _updateTimeDisplay();
    });
  }

  void _updateTimeDisplay() {
    final now = DateTime.now();
    final hour = now.hour > 12 ? now.hour - 12 : now.hour;
    final amPm = now.hour >= 12
        ? isLanguageArabic()
              ? 'مساءً'
              : 'PM'
        : isLanguageArabic()
        ? 'صباحًا'
        : 'AM';
    final formattedTime =
        '$hour:${now.minute.toString().padLeft(2, '0')} $amPm';
    currentTimeController.text = formattedTime;
    emit(AddChildState());
  }
}
