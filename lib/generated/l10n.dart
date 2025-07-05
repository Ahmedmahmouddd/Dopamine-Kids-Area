// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Enter new child`
  String get enterNewChild {
    return Intl.message(
      'Enter new child',
      name: 'enterNewChild',
      desc: '',
      args: [],
    );
  }

  /// `Enter the details of a new child to add to the system.`
  String get enterNewChildDescription {
    return Intl.message(
      'Enter the details of a new child to add to the system.',
      name: 'enterNewChildDescription',
      desc: '',
      args: [],
    );
  }

  /// `Child name`
  String get childName {
    return Intl.message('Child name', name: 'childName', desc: '', args: []);
  }

  /// `Entry ID`
  String get entryID {
    return Intl.message('Entry ID', name: 'entryID', desc: '', args: []);
  }

  /// `Primary Phone Number`
  String get primaryPhoneNumber {
    return Intl.message(
      'Primary Phone Number',
      name: 'primaryPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Secondary Phone Number`
  String get secondaryPhoneNumber {
    return Intl.message(
      'Secondary Phone Number',
      name: 'secondaryPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone number 2 (optional)`
  String get phoneNumber2Optional {
    return Intl.message(
      'Phone number 2 (optional)',
      name: 'phoneNumber2Optional',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message('Dashboard', name: 'dashboard', desc: '', args: []);
  }

  /// `Current sessions`
  String get currentSessions {
    return Intl.message(
      'Current sessions',
      name: 'currentSessions',
      desc: '',
      args: [],
    );
  }

  /// `Add child`
  String get addChild {
    return Intl.message('Add child', name: 'addChild', desc: '', args: []);
  }

  /// `Reset form`
  String get resetForm {
    return Intl.message('Reset form', name: 'resetForm', desc: '', args: []);
  }

  /// `Add Child and Print Reset`
  String get addChildAndPrintReset {
    return Intl.message(
      'Add Child and Print Reset',
      name: 'addChildAndPrintReset',
      desc: '',
      args: [],
    );
  }

  /// `Child name or group name`
  String get childNameOfGroupName {
    return Intl.message(
      'Child name or group name',
      name: 'childNameOfGroupName',
      desc: '',
      args: [],
    );
  }

  /// `Enter child ID`
  String get enterChildId {
    return Intl.message(
      'Enter child ID',
      name: 'enterChildId',
      desc: '',
      args: [],
    );
  }

  /// `Parent phone number`
  String get parentPhoneNumber {
    return Intl.message(
      'Parent phone number',
      name: 'parentPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Parent phone number (optional)`
  String get parentSecondaryPhoneNumberOptional {
    return Intl.message(
      'Parent phone number (optional)',
      name: 'parentSecondaryPhoneNumberOptional',
      desc: '',
      args: [],
    );
  }

  /// `Session duration`
  String get sessionDuration {
    return Intl.message(
      'Session duration',
      name: 'sessionDuration',
      desc: '',
      args: [],
    );
  }

  /// `Select duration`
  String get selectDuration {
    return Intl.message(
      'Select duration',
      name: 'selectDuration',
      desc: '',
      args: [],
    );
  }

  /// `30 minutes`
  String get minutes30 {
    return Intl.message('30 minutes', name: 'minutes30', desc: '', args: []);
  }

  /// `1 hour`
  String get minutes60 {
    return Intl.message('1 hour', name: 'minutes60', desc: '', args: []);
  }

  /// `1 hour and 30 minutes`
  String get minutes90 {
    return Intl.message(
      '1 hour and 30 minutes',
      name: 'minutes90',
      desc: '',
      args: [],
    );
  }

  /// `2 hours`
  String get minutes120 {
    return Intl.message('2 hours', name: 'minutes120', desc: '', args: []);
  }

  /// `2 hours and 30 minutes`
  String get minutes150 {
    return Intl.message(
      '2 hours and 30 minutes',
      name: 'minutes150',
      desc: '',
      args: [],
    );
  }

  /// `3 hours`
  String get minutes180 {
    return Intl.message('3 hours', name: 'minutes180', desc: '', args: []);
  }

  /// `Open Time`
  String get openTime {
    return Intl.message('Open Time', name: 'openTime', desc: '', args: []);
  }

  /// `Number of children`
  String get numberOfChildren {
    return Intl.message(
      'Number of children',
      name: 'numberOfChildren',
      desc: '',
      args: [],
    );
  }

  /// `Select Number`
  String get selectNumber {
    return Intl.message(
      'Select Number',
      name: 'selectNumber',
      desc: '',
      args: [],
    );
  }

  /// `Total Points`
  String get totalPoints {
    return Intl.message(
      'Total Points',
      name: 'totalPoints',
      desc: '',
      args: [],
    );
  }

  /// `Current Time`
  String get currentTime {
    return Intl.message(
      'Current Time',
      name: 'currentTime',
      desc: '',
      args: [],
    );
  }

  /// `Name is required`
  String get nameRequired {
    return Intl.message(
      'Name is required',
      name: 'nameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Entry ID is required`
  String get entryIdRequired {
    return Intl.message(
      'Entry ID is required',
      name: 'entryIdRequired',
      desc: '',
      args: [],
    );
  }

  /// `Primary phone number is required`
  String get phoneRequired {
    return Intl.message(
      'Primary phone number is required',
      name: 'phoneRequired',
      desc: '',
      args: [],
    );
  }

  /// `Session duration is required`
  String get sessionDurationRequired {
    return Intl.message(
      'Session duration is required',
      name: 'sessionDurationRequired',
      desc: '',
      args: [],
    );
  }

  /// `Phone number must start with 01`
  String get phoneMustStartWith01 {
    return Intl.message(
      'Phone number must start with 01',
      name: 'phoneMustStartWith01',
      desc: '',
      args: [],
    );
  }

  /// `Phone number must be 11 digits`
  String get phoneMustBe11Digits {
    return Intl.message(
      'Phone number must be 11 digits',
      name: 'phoneMustBe11Digits',
      desc: '',
      args: [],
    );
  }

  /// `Phone number must contain only numbers`
  String get phoneMustContainOnlyNumbers {
    return Intl.message(
      'Phone number must contain only numbers',
      name: 'phoneMustContainOnlyNumbers',
      desc: '',
      args: [],
    );
  }

  /// `Total Sessions`
  String get totalSessions {
    return Intl.message(
      'Total Sessions',
      name: 'totalSessions',
      desc: '',
      args: [],
    );
  }

  /// `Total Revenue`
  String get totalRevenue {
    return Intl.message(
      'Total Revenue',
      name: 'totalRevenue',
      desc: '',
      args: [],
    );
  }

  /// `Total Hours`
  String get totalHours {
    return Intl.message('Total Hours', name: 'totalHours', desc: '', args: []);
  }

  /// `Sessions`
  String get sessions {
    return Intl.message('Sessions', name: 'sessions', desc: '', args: []);
  }

  /// `Points`
  String get points {
    return Intl.message('Points', name: 'points', desc: '', args: []);
  }

  /// `Hours`
  String get hours {
    return Intl.message('Hours', name: 'hours', desc: '', args: []);
  }

  /// `LE`
  String get le {
    return Intl.message('LE', name: 'le', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
