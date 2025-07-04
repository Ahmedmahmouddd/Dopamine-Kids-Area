import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kids_area_system/core/helpers/helpers.dart';
import 'package:kids_area_system/generated/l10n.dart';

part 'add_child_state.dart';

class AddChildCubit extends Cubit<AddChildState> {
  AddChildCubit() : super(AddChildInitial()) {
    _initTimeUpdates();
    // Initialize points to 0 on startup
    pointsController.text = '0';
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

  // void resetForm() {
  //   nameController.clear();
  //   idController.clear();
  //   phone1Controller.clear();
  //   phone2Controller.clear();
  //   currentTimeController.clear();
  //   selectedDuration = null;
  //   selectedChildrenCount = '1';
  //   pointsController.text = '0'; // Directly set to 0 here
  //   emit(AddChildInitial()); // This creates fresh state
  //   formKey.currentState?.reset();
  // }

  void resetForm() {
    // Clear all controllers
    nameController.clear();
    idController.clear();
    phone1Controller.clear();
    phone2Controller.clear();
    currentTimeController.clear();

    // Reset variables
    selectedDuration = null;
    selectedChildrenCount = '1';

    // Directly set points to 0
    pointsController.text = '0';

    // Reset form and emit new state
    formKey.currentState?.reset();
    emit(AddChildInitial());
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
    _calculatePoints();
    emit(AddChildState());
  }

  void updateChildrenCount(String? value) {
    selectedChildrenCount = value ?? '1';
    _calculatePoints();
    emit(AddChildState());
  }

  void _initTimeUpdates() {
    _updateTimeDisplay();
    timeTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      _updateTimeDisplay();
    });
  }

  void _updateTimeDisplay() {
    final now = DateTime.now();
    final hour = now.hour > 12 ? now.hour - 12 : now.hour;
    final amPm = now.hour >= 12
        ? (isLanguageArabic() ? 'مساءً' : 'PM')
        : (isLanguageArabic() ? 'صباحًا' : 'AM');
    final formattedTime =
        '$hour:${now.minute.toString().padLeft(2, '0')} $amPm';
    currentTimeController.text = formattedTime;
    emit(AddChildState());
  }

  void _calculatePoints() {
    if (selectedDuration == null) {
      pointsController.text = '0';
      return;
    }

    final points = switch (selectedDuration) {
      '30' => 125,
      '60' => 250,
      '90' => 375,
      '120' => 500,
      '150' => 625,
      '180' => 750,
      'open' => 0,
      _ => 0,
    };

    final children = int.tryParse(selectedChildrenCount) ?? 1;
    pointsController.text = (points * children).toString();
  }
}
