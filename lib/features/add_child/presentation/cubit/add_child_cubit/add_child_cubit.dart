import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kids_area_system/generated/l10n.dart';

part 'add_child_state.dart';

class AddChildCubit extends Cubit<AddChildState> {
  AddChildCubit() : super(AddChildInitial());

  static String? validateName(String? value, BuildContext context) {
    if (value == null || value.isEmpty) return S.of(context).nameRequired;
    return null;
  }

  static String? validateId(String? value, BuildContext context) {
    if (value == null || value.isEmpty) return S.of(context).entryIdRequired;
    return null;
  }

  static String? validatePrimaryPhone(String? value, BuildContext context) {
    if (value == null || value.isEmpty) return S.of(context).phoneRequired;
    if (!RegExp(r'^[0-9]+$').hasMatch(value.trim())) {
      return S.of(context).phoneMustContainOnlyNumbers;
    }
    if (value.trim().length != 11) return S.of(context).phoneMustBe11Digits;
    return null;
  }

  static String? validateSecondaryPhone(String? value, BuildContext context) {
    if (value != null && value.isNotEmpty) {
      if (!RegExp(r'^[0-9]+$').hasMatch(value.trim())) {
        return S.of(context).phoneMustContainOnlyNumbers;
      }
      if (value.trim().length != 11) return S.of(context).phoneMustBe11Digits;
      return null;
    }
    return null;
  }

  static String? validateSessionDuration(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).sessionDurationRequired;
    }
    return null;
  }
}
