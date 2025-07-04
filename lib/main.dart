import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kids_area_system/core/widgets/main_layout.dart';
import 'package:kids_area_system/core/theme/app_theme.dart';
import 'package:kids_area_system/generated/l10n.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  if (Platform.isWindows || Platform.isMacOS) {
    WindowOptions options = const WindowOptions(
      minimumSize: Size(1000, 800),
      size: Size(1000, 800), // This will be ignored when maximized
      center: true,
      backgroundColor: Colors.transparent,
      titleBarStyle: TitleBarStyle.normal,
    );

    windowManager.waitUntilReadyToShow(options, () async {
      // First show the window
      await windowManager.show();

      // Then maximize it (this gives the "zoomed" state on macOS)
      await windowManager.maximize();

      // Focus the window
      await windowManager.focus();
    });
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: AppTheme.lightTheme,
      home: const MainLayout(),
    );
  }
}
