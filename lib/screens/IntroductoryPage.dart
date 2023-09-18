import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innofest_app/main.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class IntroductoryPage extends StatefulWidget {
  const IntroductoryPage({super.key, required this.pageIndex});
  final int pageIndex;
  @override
  State<IntroductoryPage> createState() => _IntroductoryPageState();
}

class _IntroductoryPageState extends State<IntroductoryPage> {
  @override
  Widget build(BuildContext context) {
    String textChoice = widget.pageIndex == 1
        ? "Planks"
        : widget.pageIndex == 2
            ? "Seat-stretching"
            : widget.pageIndex == 3
                ? "Jumping Jacks"
                : "Push Ups";
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
                      "Let's learn how to do: \n$textChoice!",
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
              /* Text(
                "Throughout the course of this tutorial, while doing the exercise, please place you device with your front camera facing you, with all of your body limps visible to the camera.",
                style: TextStyle(
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold,
                ),
              ),*/
              Lottie.asset(
                widget.pageIndex == 1
                    ? "assets/plank/plank-start.json"
                    : widget.pageIndex == 2
                        ? "assets/lottie-jsons/stretch.json"
                        : widget.pageIndex == 3
                            ? "assets/jumping-jack/jumping-jack.json"
                            : "assets/lottie-jsons/pushup-1.json",
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.height * 0.5,
                frameRate: FrameRate(60),
              ),
              FilledButton(
                onPressed: () {
                  
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (builder) => StepsPage(
                        instructions1: widget.pageIndex == 1
                            ? "1. Get on all fours. \n2. Place forearms on the floor with elbows aligned below shoulders and arms parallel to your body at about shoulder width"
                            : widget.pageIndex == 2
                                ? "1. Sit with the legs together, feet flexed, and hands on the shins or ankles. \n 2. Bring the chin toward the knees. "
                                : widget.pageIndex == 3
                                    ? "1. Stand upright with your legs together, arms at your sides.\n 2. Bend your knees slightly, and jump into the air."
                                    : "1. Get on all fours and straighten out your legs and arms\n2. Place your hands slightly wider than shoulder length",
                        contentPath1: widget.pageIndex == 1
                            ? "assets/plank/plank1.png"
                            : widget.pageIndex == 2
                                ? "assets/seat-stretch/seatstretch.png"
                                : widget.pageIndex == 3
                                    ? "assets/jumping-jack/jumpjack.png"
                                    : "assets/pushup/pushup-pose.png",
                        instructions2: widget.pageIndex == 1
                            ? "3. If flats palms bother your wrists, clasp your hands together.\nHold position for 1-2 mins "
                            : widget.pageIndex == 2
                                ? "3. Hold for five seconds. \n 4. Repeat three to six times "
                                : widget.pageIndex == 3
                                    ? "3. As you jump, spread your legs to be about shoulder-width apart. Stretch your arms out and over your head.\n 4. Jump back to starting position "
                                    : "3. Lower your body until your chest nearly touches the floor,\npush your body back up again. Repeat.",
                        contentPath2: widget.pageIndex == 1
                            ? "assets/plank/plank1.png"
                            : widget.pageIndex == 2
                                ? "assets/seat-stretch/seatstretch.png"
                                : widget.pageIndex == 3
                                    ? "assets/jumping-jack/jumpjack.png"
                                    : "assets/pushup/pushup2.png",
                      ),
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
