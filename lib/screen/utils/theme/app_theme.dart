import 'package:flutter/material.dart';

ThemeData lightThemeMode = ThemeData(
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),

  ),

  iconTheme: const IconThemeData(
    color: Colors.grey,
  ),
);
ThemeData darkThemeMode = ThemeData(
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(color: Colors.white,fontSize: 20,),

    backgroundColor: Colors.black,
  ),
  colorSchemeSeed: Colors.white,

  brightness: Brightness.dark,
);