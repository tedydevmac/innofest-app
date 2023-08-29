import 'package:flutter/material.dart';
import 'package:innofest_app/screens/SplashScreenPage.dart';

final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: Colors.green);

final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    primaryColor: Colors.lightGreen);

void main() {
  runApp(
    MaterialApp(
      home: const SplashScreenPage(),
      title: "WorkBud",
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
    ),
  );
}
