import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'theme_spacings.dart';
import 'theme_text_styles.dart';

part 'theme_colors.dart';

/// Class to store the design system themes
///commit teste
class CnThemes {
  /// Instance of light theme
  ThemeData get lightTheme => ThemeData(
        colorScheme: cnColorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: cnColorScheme.background,
          elevation: 0,
          shadowColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          iconTheme: IconThemeData(
            color: cnColorScheme.cnBlack, //change your color here
          ),
        ),
        disabledColor: cnColorScheme.cnLightGrey,
        elevatedButtonTheme: elevatedButtonTheme,
        scaffoldBackgroundColor: cnColorScheme.background,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: cnColorScheme.background,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(32),
            ),
          ),
        ),
        extensions: <ThemeExtension>[
          CnTextStyles(
            headingL: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 40,
              letterSpacing: -0.05,
              height: 1.2,
              color: cnColorScheme.cnGrey,
            ),
            headingM: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 32,
              letterSpacing: -0.05,
              height: 1.2,
              color: cnColorScheme.cnGrey,
            ),
            headingS: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 28,
              letterSpacing: -0.04,
              height: 1.2,
              color: cnColorScheme.cnGrey,
            ),
            headingT: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
              letterSpacing: -0.04,
              height: 1.2,
              color: cnColorScheme.cnGrey,
            ),
            textLMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.03,
              height: 1.2,
              color: cnColorScheme.cnGrey,
            ),
            textLRegular: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              letterSpacing: -0.03,
              height: 1.2,
              color: cnColorScheme.cnGrey,
            ),
            textMMedium: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              letterSpacing: -0.03,
              height: 1.2,
              color: cnColorScheme.cnGrey,
            ),
            textMRegular: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              letterSpacing: -0.03,
              height: 1.2,
              color: cnColorScheme.cnGrey,
            ),
            textSRegular: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.02,
              height: 1.2,
              color: cnColorScheme.cnGrey,
            ),
            textSMedium: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              letterSpacing: -0.02,
              height: 1.2,
              color: cnColorScheme.cnGrey,
            ),
            textTMedium: TextStyle(
              fontSize: 12,
              letterSpacing: -0.01,
              fontWeight: FontWeight.w500,
              height: 1.2,
              color: cnColorScheme.cnGrey,
            ),
            textTRegular: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.01,
              height: 1.2,
              color: cnColorScheme.cnGrey,
            ),
          ),
          const CnSpacing(
            spacing4px: 4,
            spacing8px: 8,
            spacing12px: 12,
            spacing16px: 16,
            spacing24px: 24,
            spacing32px: 32,
            spacing40px: 40,
            spacing48px: 48,
            spacing64px: 64,
            spacing80px: 80,
            spacing96px: 96,
            spacing128px: 128,
          )
        ],
      );

  /// Instance of dark theme
  ThemeData get darkTheme => ThemeData.dark();

  /// Elevated Button Theme
  ElevatedButtonThemeData get elevatedButtonTheme => ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return _CnThemeColors.cnWhite;
            }
            return _CnThemeColors.cnWhite;
          }),
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.pressed)) {
                return _CnThemeColors.cnDarkGrey;
              } else if (states.contains(WidgetState.disabled)) {
                return _CnThemeColors.cnLightBlue;
              }

              return _CnThemeColors.cnBlack;
            },
          ),
        ),
      );
}
