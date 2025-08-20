import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../colors/app_colors.dart';
import '../colors/main_colors.dart';
import '../styles/font_styles.dart';
import '../styles/main_styles.dart';

class AppTheme {
  static ThemeData getTheme({
    required BuildContext context,
  }) {
    final MainColors colors = LightColors();
    final MainStyles font = FontStyles();

    return ThemeData(
      scaffoldBackgroundColor: colors.backgroundColor,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: colors.primary1,
        onPrimary: colors.textColor,
        secondary: colors.secondaryBackgroundColor,
        onSecondary: colors.textColor2,
        tertiary: colors.primary1,
        onTertiary: colors.primary2,
        error: colors.error,
        onError: colors.textColor,
        surface: colors.secondaryBackgroundColor,
        onSurface: colors.textColor2,
      ),
      textTheme: TextTheme(
        displayLarge: font.bodyLargeBold(context, colors.textColor),
        displayMedium: font.bodyMediumMedium(context, colors.textColor),
        displaySmall: font.bodySmallRegular(context, colors.textColor),
        headlineMedium: font.bodyXLargeBold(context, colors.textColor),
        headlineSmall: font.bodyLargeRegular(context, colors.textColor),
        titleLarge: font.h6(context, colors.textColor),
        bodyLarge: font.bodyXLargeBold(context, colors.textColor),
        bodyMedium: font.bodyXLargeMedium(context, colors.textColor),
        titleMedium: font.h4(context, colors.textColor3),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: Theme.of(context).textTheme.titleMedium,
          backgroundColor: colors.primary1,
          foregroundColor: colors.textColor2,
          side: BorderSide(
            color: colors.primary1,
            width: 2.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        ),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: colors.backgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: colors.secondaryBackgroundColor),
        titleTextStyle: font.h4(context, colors.textColor),
      ),

    );
  }
}
