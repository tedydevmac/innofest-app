import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:innofest_app/screens/HomePage.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.scale(
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.lightGreen,
          Colors.green,
        ],
      ),
      childWidget: SizedBox(
        height: MediaQuery.of(context).size.height * 0.95,
        width: MediaQuery.of(context).size.width * 0.95,
        child: Image.asset("assets/splashhome/logo-transparent.png"),
      ),
      duration: const Duration(milliseconds: 1500),
      animationDuration: const Duration(milliseconds: 1000),
      defaultNextScreen: const HomePage(),
    );
  }
}
