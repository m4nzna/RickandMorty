import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Color(0xFF310069),
    splashColor: Color(0XFFDCE7C7),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 40),
        backgroundColor: Color(0xFF310069),
        foregroundColor: Colors.white,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: Size(double.infinity, 40),
        backgroundColor: Colors.white,
        foregroundColor: Color(0xFF310069),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFE9E8E1),
      foregroundColor: Color(0xFF310069),
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(56)),
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
    ),

    drawerTheme: DrawerThemeData(backgroundColor: Color(0xFFE9E8E1)),
  );
}
