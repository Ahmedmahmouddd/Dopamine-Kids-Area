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

  /// `Phone number 1`
  String get phoneNumber1 {
    return Intl.message(
      'Phone number 1',
      name: 'phoneNumber1',
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
