import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innofest_app/main.dart';
import 'package:innofest_app/screens/InstructionPage.dart';
import 'package:innofest_app/screens/SplashScreenPage.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class IntroductoryPage extends StatefulWidget {
  const IntroductoryPage({super.key});

  @override
  State<IntroductoryPage> createState() => _IntroductoryPageState();
}

class _IntroductoryPageState extends State<IntroductoryPage> {
  @override
  Widget build(BuildContext context) {
    bool showButton = false;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "Let's learn how to do: \nPush-ups!",
                      textStyle: const TextStyle(
                        fontSize: 34.0,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                  pause: const Duration(seconds: 2),
                  displayFullTextOnTap: true,
                  isRepeatingAnimation: true,
                  totalRepeatCount: 1,
                  repeatForever: false,
                  onFinished: () {
                    setState(() {
                      showButton = true;
                    });
                  },
                ),
              ),
              Lottie.asset(
                "lottie-jsons/animation_lm6jpgpz.json",
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.height * 0.5,
                frameRate: FrameRate(60),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (builder) => const SplashScreenPage(),
                    ),
                  );
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.resolveWith((states) => 1.5),
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.light
                          ? MaterialStateProperty.resolveWith(
                              (states) => lightTheme.primaryColor)
                          : MaterialStateProperty.resolveWith(
                              (states) => darkTheme.primaryColor),
                  enableFeedback: true,
                  shape: MaterialStateProperty.resolveWith(
                    (states) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15 * (MediaQuery.of(context).size.width / 411),
                      ),
                    ),
                  ),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.5 * (MediaQuery.of(context).size.height / 867),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
