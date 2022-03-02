import 'package:flutter/material.dart';

ThemeData globalThemes (bool dTheme){
  Color _primaryColor= Colors.amber;
  return ThemeData(
    //primaryColor: Colors.amber,
    colorScheme: ColorScheme.fromSwatch(
      brightness: dTheme? Brightness.dark:Brightness.light,
      primarySwatch: Colors.amber,
    ).copyWith(),
    textTheme: const TextTheme(
      headline3: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
      headline4: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
      headline6: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
      bodyText1: TextStyle(fontSize: 10, color: Colors.black),

    )
  );
}