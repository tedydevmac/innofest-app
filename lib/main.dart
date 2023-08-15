import 'package:flutter/material.dart';
import 'package:innofest_app/screens/HomePage.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true
);

void main() {
  runApp(const HomePage());
}
