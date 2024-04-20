import 'package:flutter/material.dart';
import 'package:second_memory/src/utils/resources/styles_manager.dart';
import 'package:second_memory/src/utils/resources/values_manager.dart';
import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() => ThemeData(
      // main colors of the app
      useMaterial3: true,
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.primaryOpacity70,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      splashColor: ColorManager.primaryOpacity70,
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: ColorManager.primary),
      // zamiast accentColor
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.black,
        splashColor: Colors.grey,
        elevation: 0.0,
      ),
      cardTheme: CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.grey,
          elevation: AppSize.s14),
      appBarTheme: AppBarTheme(
        shadowColor: ColorManager.primaryOpacity70,
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.s4,
        titleTextStyle: getRegularStyle(
            color: ColorManager.darkGrey, fontSize: FontSize.s20),
      ),
      buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.primaryOpacity70,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: getRegularStyle(
            color: ColorManager.white,
          ),
          backgroundColor: ColorManager.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
        ),
      ),
      textTheme: TextTheme(
        displayLarge:
            getSemiBoldStyle(color: ColorManager.white, fontSize: FontSize.s16),
        titleMedium:
            getSemiBoldStyle(color: ColorManager.white, fontSize: FontSize.s14),
        titleSmall:
            getSemiBoldStyle(color: ColorManager.white, fontSize: FontSize.s14),
        bodySmall: getRegularStyle(color: ColorManager.white),
        bodyLarge: getRegularStyle(color: ColorManager.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        hintStyle: getRegularStyle(color: ColorManager.grey1),
        labelStyle: getMediumStyle(color: ColorManager.darkGrey),
        errorStyle: getRegularStyle(color: ColorManager.error),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s14),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s14),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.error, width: AppSize.s14),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s14),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
        ),
      ),
    );
