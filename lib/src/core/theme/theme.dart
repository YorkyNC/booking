import 'package:booking/src/core/theme/colors.dart';
import 'package:booking/src/core/theme/typography.dart';
import 'package:booking/src/core/utils/constants/app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'color_schemes.dart';
part 'text_theme.dart';
part 'theme_provider.dart';

class AppTheme {
  static const AppColors colors = AppColors();
  static const FigmaTextStyles typography = FigmaTextStyles();
  static final AppIcons icons = AppIcons();

  static final defaultInputBorder =
      OutlineInputBorder(borderSide: BorderSide(color: colors.gray200), borderRadius: BorderRadius.circular(8));

  static const buttonPadding = EdgeInsets.fromLTRB(14, 18, 14, 18);

  static final appTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: textTheme,
      bottomSheetTheme: const BottomSheetThemeData(constraints: BoxConstraints.expand()),
      iconTheme: IconThemeData(
        color: colors.black,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(1),
          backgroundColor: WidgetStatePropertyAll(colors.white),
          shadowColor: const WidgetStatePropertyAll(Color(0x0D0A0D12)),
          textStyle: WidgetStatePropertyAll(
            typography.textsmSemibold.copyWith(
              height: 1, //TODO height does not work properly with icon
            ),
          ),
          foregroundColor: WidgetStatePropertyAll(
            colors.gray700,
          ),
          padding: const WidgetStatePropertyAll(buttonPadding),
          visualDensity: VisualDensity.compact,
          overlayColor: WidgetStatePropertyAll(colors.gray50),
          iconColor: WidgetStatePropertyAll(colors.black),
          iconSize: const WidgetStatePropertyAll(20),
          shape: const WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          side: const WidgetStatePropertyAll(
            BorderSide(
              color: Color(0xFFD5D7DA),
            ),
          ),
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colors.brand100,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: const WidgetStatePropertyAll(buttonPadding),
          visualDensity: VisualDensity.compact,
          overlayColor: WidgetStatePropertyAll(colors.buttonColor),
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return colors.buttonColor50;
              }
              return colors.buttonColor;
            },
          ),
          shape: const WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
          textStyle: WidgetStatePropertyAll(
            typography.textsmSemibold.copyWith(
              height: 1, //TODO height does not work properly with icon
            ),
          ),
          foregroundColor: WidgetStatePropertyAll(
            colors.white,
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          padding: const WidgetStatePropertyAll(buttonPadding),
          visualDensity: VisualDensity.compact,
          backgroundColor: WidgetStatePropertyAll(colors.brand25),
          overlayColor: WidgetStatePropertyAll(colors.brand50),
          shape: const WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          textStyle: WidgetStatePropertyAll(
            typography.textsmSemibold.copyWith(
              height: 1, //TODO height does not work properly with icon
            ),
          ),
          iconColor: WidgetStatePropertyAll(colors.brand600),
          iconSize: const WidgetStatePropertyAll(20),
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return colors.brand50;
              }
              return colors.brand600;
            },
          ),
        ),
      ),
      dividerTheme: DividerThemeData(space: 0, color: colors.gray100),
      checkboxTheme: CheckboxThemeData(
        checkColor: WidgetStatePropertyAll(colors.brand25),
        fillColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return colors.blueGray400;
            }
            return Colors.transparent;
          },
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: defaultInputBorder,
        focusedBorder: defaultInputBorder.copyWith(
          borderSide: BorderSide(color: colors.brand300),
        ),
        enabledBorder: defaultInputBorder,
        hintStyle: typography.textmdRegular.copyWith(
          color: colors.gray500,
        ),
        iconColor: colors.black,
        prefixIconColor: colors.black,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colors.brand300,
        selectionHandleColor: colors.brand300,
        selectionColor: colors.brand50,
      ),
      cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
        primaryColor: colors.brand300,
      ));

  static final appThemeDark = appTheme.copyWith(
    brightness: Brightness.dark,
    textTheme: textTheme,
  );

  static final appThemeLight = appTheme.copyWith(
    brightness: Brightness.dark,
    textTheme: textTheme,
  );
}

class MaterialAppTheme {
  static final materialTheme = ThemeData(
    colorSchemeSeed: Colors.amber,
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: textTheme,
  );

  static final materialLight = materialTheme.copyWith(
    brightness: Brightness.light,
    textTheme: textTheme,
  );

  static final materialDark = materialTheme.copyWith(
    brightness: Brightness.dark,
    textTheme: textTheme,
  );
}
