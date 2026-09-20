import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movier/common/theme/player_theme.dart';
import 'package:movier/common/theme/smooth_border_theme.dart';

abstract class ThemeDataFactory {
  static ThemeData light() {
    const primary = Color(0xFF4A7C59);
    const background = Color(0xFFFAF6F0);
    const tertiary = Color(0xFF705C30);
    const onBackground = Color(0xFF2E2A24);
    const onBackgroundMuted = Color(0xFF6B6358);
    const surfaceVariant = Color(0xFFF0EBE3);
    const outline = Color(0xFFCBC5BA);

    final colorScheme = ColorScheme.light(
      primary: primary,
      onPrimary: Colors.white,
      secondary: primary,
      tertiary: tertiary,
      onTertiary: Colors.white,
      surface: background,
      onSurface: onBackground,
      onSurfaceVariant: onBackgroundMuted,
      errorContainer: Color(0xffE4E0D8),
      surfaceContainerHighest: surfaceVariant,
      outline: outline,
      outlineVariant: const Color(0xFFDDD8D0),
      error: const Color(0xFFB44040),
    );

    final headlineStyle = GoogleFonts.literata();
    final bodyStyle = GoogleFonts.nunitoSans();

    final textTheme = TextTheme(
      displayLarge: headlineStyle.copyWith(fontSize: 57, fontWeight: FontWeight.w400, height: 1.3),
      displayMedium: headlineStyle.copyWith(fontSize: 45, fontWeight: FontWeight.w400, height: 1.3),
      displaySmall: headlineStyle.copyWith(fontSize: 36, fontWeight: FontWeight.w400, height: 1.3),
      headlineLarge: headlineStyle.copyWith(fontSize: 32, fontWeight: FontWeight.w600, height: 1.4),
      headlineMedium: headlineStyle.copyWith(fontSize: 28, fontWeight: FontWeight.w600, height: 1.4),
      headlineSmall: headlineStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w600, height: 1.4),
      titleLarge: headlineStyle.copyWith(fontSize: 22, fontWeight: FontWeight.w500, height: 1.4),
      titleMedium: bodyStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600, height: 1.5, letterSpacing: 0.15),
      titleSmall: bodyStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w600, height: 1.5, letterSpacing: 0.1),
      bodyLarge: bodyStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w400, height: 1.6),
      bodyMedium: bodyStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400, height: 1.6),
      bodySmall: bodyStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w400, height: 1.6),
      labelLarge: bodyStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w600, height: 1.4, letterSpacing: 0.1),
      labelMedium: bodyStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w600, height: 1.4, letterSpacing: 0.5),
      labelSmall: bodyStyle.copyWith(fontSize: 11, fontWeight: FontWeight.w600, height: 1.4, letterSpacing: 0.5),
    ).apply(bodyColor: onBackground, displayColor: onBackground);

    final extensions = <ThemeExtension<Object?>>{
      SmoothBorderThemeData(color: Color(0xffC4C8BC)),
      PlayerThemeData(progress: primary),
    };

    return ThemeData(
      useMaterial3: true,
      extensions: extensions,
      colorScheme: colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: background,
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: onBackground,
        elevation: 0,
        scrolledUnderElevation: 1,
        titleTextStyle: headlineStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w600, color: onBackground),
      ),
      splashColor: colorScheme.primary.withValues(alpha: .5),
      splashFactory: InkRipple.splashFactory,
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: outline.withValues(alpha: 0.5)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          textStyle: bodyStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primary,
          side: const BorderSide(color: primary),
          textStyle: bodyStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primary,
          textStyle: bodyStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w700),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceVariant,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        hintStyle: bodyStyle.copyWith(color: onBackgroundMuted, fontSize: 14),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: surfaceVariant,
        selectedColor: primary.withValues(alpha: 0.15),
        labelStyle: bodyStyle.copyWith(fontSize: 13, fontWeight: FontWeight.w600),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      badgeTheme: BadgeThemeData(
        backgroundColor: tertiary,
        textColor: Colors.white,
        textStyle: bodyStyle.copyWith(fontSize: 11, fontWeight: FontWeight.w700),
      ),
      dividerTheme: DividerThemeData(color: outline.withValues(alpha: 0.5), thickness: 1),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: background,
        selectedItemColor: primary,
        unselectedItemColor: onBackgroundMuted,
        selectedLabelStyle: bodyStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w700),
        unselectedLabelStyle: bodyStyle.copyWith(fontSize: 12),
      ),

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: background,
        indicatorColor: primary.withValues(alpha: 0.15),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return bodyStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w700, color: primary);
          }
          return bodyStyle.copyWith(fontSize: 12, color: onBackgroundMuted);
        }),
      ),
    );
  }
}
