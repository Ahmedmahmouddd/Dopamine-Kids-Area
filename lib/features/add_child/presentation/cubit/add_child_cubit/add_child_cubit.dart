import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kids_area_system/generated/l10n.dart';

part 'add_child_state.dart';

class AddChildCubit extends Cubit<AddChildState> {
  AddChildCubit() : super(AddChildInitial());

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final idController = TextEditingController();
  final phone1Controller = TextEditingController();
  final phone2Controller = TextEditingController();
  final pointsController = TextEditingController();
  final currentTimeController = TextEditingController();

  String? selectedDuration;
  String selectedChildrenCount = '1';



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

  

   void updateSelectedDuration(String? value) {
    selectedDuration = value;
    emit(AddChildState()); // Rebuild listeners
  }

  void updateChildrenCount(String? value) {
    selectedChildrenCount = value ?? '1';
    emit(AddChildState()); // Rebuild listeners
  }
}
