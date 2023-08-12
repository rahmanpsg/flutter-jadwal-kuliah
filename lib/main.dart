import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:jadwal_kuliah/ui/common/app_themes.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:jadwal_kuliah/app/app.bottomsheets.dart';
import 'package:jadwal_kuliah/app/app.dialogs.dart';
import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.router.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_animate/flutter_animate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await setupLocator(stackedRouter: stackedRouter);
  setupDialogUi();
  setupBottomSheetUi();
  await ThemeManager.initialise();

  await Supabase.initialize(
    url: const String.fromEnvironment('SUPABASE_URL'),
    anonKey: const String.fromEnvironment('SUPABASE_ANON_KEY'),
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (_) => ThemeBuilder(
        defaultThemeMode: ThemeMode.light,
        darkTheme: AppThemes.lightTheme,
        // darkTheme: AppThemes.darkTheme,
        lightTheme: AppThemes.lightTheme,
        builder: (context, regularTheme, darkTheme, themeMode) => Portal(
          child: MaterialApp.router(
            theme: regularTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
                PointerDeviceKind.stylus,
                PointerDeviceKind.unknown
              },
            ),
            routerDelegate: stackedRouter.delegate(),
            routeInformationParser: stackedRouter.defaultRouteParser(),
          ),
        ),
      ),
    ).animate().fadeIn(
          delay: const Duration(milliseconds: 50),
          duration: const Duration(milliseconds: 400),
        );
  }
}
