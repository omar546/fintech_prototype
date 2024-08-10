import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

enum AppTheme { Light, Dark }

class ThemeCubit extends Cubit<ThemeData> {
  static const String themeKey = 'theme';
  ThemeCubit() : super(lightTheme) {
    // only light for now
    final themeIndex = AppTheme.Light.index;
    // if (themeIndex == AppTheme.Dark.index) {
    //   emit(darkTheme);
    // } else {
    emit(lightTheme);
    // }
  }

  // void toggleTheme() {
  //   if (state == lightTheme) {
  //     // CacheHelper.saveData(key: themeKey, value: AppTheme.Dark.index);
  //     emit(darkTheme);
  //   } else {
  //     // CacheHelper.saveData(key: themeKey, value: AppTheme.Light.index);
  //     emit(lightTheme);
  //   }
  // }

  // bool get isDarkTheme => state == darkTheme;
}

ThemeData lightTheme = ThemeData(
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
    )),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 30,
      backgroundColor: Styles.whiteColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Styles.blackColor,
      unselectedItemColor: Colors.black26,
      selectedLabelStyle: TextStyle(fontFamily: 'quicksand'),
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Styles.blackColor),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Styles.greyColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Styles.whiteColor,
      elevation: 0.0,
      titleTextStyle: TextStyle(color: Styles.blackColor),
    ),
    scaffoldBackgroundColor: Styles.whiteColor,
    textTheme: TextTheme(
      bodyMedium: const TextStyle(
        color: Styles.blackColor,
      ),
      bodySmall: TextStyle(
          color: Styles.blackColor.withOpacity(0.5), fontFamily: 'quicksand'),
    ),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: Styles.blackColor,
      suffixIconColor: Styles.greyColor.withOpacity(0.5),
      labelStyle: const TextStyle(color: Styles.blackColor),
    ));
