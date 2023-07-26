import 'package:flutter/material.dart';
import 'package:jadwal_kuliah/ui/common/app_colors.dart';
import 'package:jadwal_kuliah/ui/common/app_texts.dart';

class AppThemes {
  static final ThemeData _defaultTheme = ThemeData(
    useMaterial3: true,
    primaryColor: kcPrimaryColor,
    // colorScheme: ColorScheme.fromSwatch(
    //   primarySwatch: MaterialColor(, swatch),
    //   accentColor: kcSecondaryColor,
    //   errorColor: kcDangerColor,
    //   backgroundColor: kcBackgroundColor,
    //   brightness: Brightness.light,
    // ),
    colorScheme: const ColorScheme.light(
      primary: kcPrimaryColor,
      secondary: kcSecondaryColor,
      error: kcDangerColor,
      onError: kcDangerColor,
      background: kcBackgroundColor,
      tertiary: kcTertiaryColor,
    ),
    scaffoldBackgroundColor: kcBackgroundColor,
    canvasColor: kcBackgroundColor,
    fontFamily: 'Oswald',
    appBarTheme: AppBarTheme(
      elevation: 0,
      titleTextStyle: ktRegularTextStyle.copyWith(
        fontSize: 16,
      ),
      centerTitle: true,
      backgroundColor: kcBackgroundColor,
      surfaceTintColor: kcBackgroundColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kcPrimaryColor,
        foregroundColor: Colors.white,
        disabledBackgroundColor: kcPrimaryColor.withOpacity(.25),
        disabledForegroundColor: Colors.white.withOpacity(.8),
        minimumSize: const Size(0, 44),
        textStyle: ktRegularTextStyle.copyWith(
          fontSize: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: ktRegularTextStyle.copyWith(
          fontSize: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: BorderSide(
          color: Colors.black.withOpacity(.05),
          width: 1,
        ),
        foregroundColor: kcMediumGrey,
        minimumSize: const Size(0, 44),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        disabledForegroundColor: kcPrimaryColor.withOpacity(
          .3,
        ),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: ktRegularTextStyle.copyWith(
          fontSize: 16,
        ),
        shadowColor: Colors.transparent,
      ),
    ),
    iconTheme: const IconThemeData(
      color: kcPrimaryColor,
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(Colors.transparent),
      checkColor: MaterialStateProperty.all(kcPrimaryColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(kcPrimaryColor),
    ),
    cardColor: kcBackgroundColor,
    cardTheme: CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  static ThemeData get lightTheme => _defaultTheme;

  static ThemeData get darkTheme => _defaultTheme.copyWith(
        colorScheme: const ColorScheme.dark(
          primary: kcPrimaryColorDark,
          secondary: kcSecondaryColor,
          error: kcDangerColor,
          onError: kcDangerColor,
          background: kcBackgroundColorDark,
        ),
        textTheme: _defaultTheme.textTheme
            .apply(
              fontFamily: 'Oswald',
            )
            .apply(
              bodyColor: kcFontColorDark,
              displayColor: kcFontColorDark,
            ),
        scaffoldBackgroundColor: kcBackgroundColorDark,
        canvasColor: kcBackgroundColorDark,
        appBarTheme: AppBarTheme(
          elevation: 0,
          titleTextStyle: ktRegularTextStyle.copyWith(
            fontSize: 16,
          ),
          centerTitle: true,
          backgroundColor: kcBackgroundColorDark,
          surfaceTintColor: kcBackgroundColorDark,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kcPrimaryColor,
            foregroundColor: Colors.white,
            disabledBackgroundColor: kcPrimaryColor.withOpacity(.25),
            disabledForegroundColor: Colors.white.withOpacity(.8),
            minimumSize: const Size(0, 44),
            textStyle: ktRegularTextStyle.copyWith(
              fontSize: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            shadowColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            textStyle: ktRegularTextStyle.copyWith(
              fontSize: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            side: BorderSide(
              color: Colors.black.withOpacity(.05),
              width: 1,
            ),
            foregroundColor: kcMediumGrey,
            minimumSize: const Size(0, 44),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            disabledForegroundColor: kcPrimaryColor.withOpacity(
              .3,
            ),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            textStyle: ktRegularTextStyle.copyWith(
              fontSize: 16,
            ),
            shadowColor: Colors.transparent,
          ),
        ),
        iconTheme: const IconThemeData(
          color: kcPrimaryColor,
        ),
        listTileTheme: ListTileThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(Colors.transparent),
          checkColor: MaterialStateProperty.all(kcPrimaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        cardColor: kcBackgroundColorDark,
      );
}
