import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:innofest_app/components/StepPage2.dart';
import 'package:innofest_app/screens/SplashScreenPage.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

List<CameraDescription>? cameras;
int points = 0;
SharedPreferences? prefs;

final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: Colors.green);

final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    primaryColor: Colors.lightGreen);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  prefs = await SharedPreferences.getInstance();
  if (prefs!.getInt("budpoints") == null) await prefs!.setInt("budpoints", 0);
  if (prefs!.getInt("budgoal") == null) await prefs!.setInt("budgoal", 100);
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

class StepsPage extends StatefulWidget {
  const StepsPage({
    super.key,
    required this.instructions1,
    required this.contentPath1,
    required this.instructions2,
    required this.contentPath2,
  });
  final String instructions1;
  final String contentPath1;
  final String instructions2;
  final String contentPath2;

  @override
  State<StepsPage> createState() => _StepsPageState();
}

class _StepsPageState extends State<StepsPage> {
  late CameraController _controller;
  CameraImage? picture;
  XFile? imageforshow;
  bool replace = false;
  bool isLoading = false;
  CameraDescription? getFrontCamera() {
    for (CameraDescription camera in cameras!) {
      if (camera.lensDirection == CameraLensDirection.front) {
        return camera;
      }
    }
    return null; // No front camera found
  }

  @override
  void initState() {
    super.initState();

    CameraDescription? frontCamera = getFrontCamera();
    frontCamera ??= cameras!.first;
    _controller = CameraController(
      frontCamera,
      ResolutionPreset.max,
      enableAudio: false,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.nv21
          : ImageFormatGroup.bgra8888,
    );
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print("Access to the camera was denied.");
            break;
          default:
            print(e.description);
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                widget.instructions1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19 * (MediaQuery.of(context).size.height / 867),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.68,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.68 * 0.625,
                    width: MediaQuery.of(context).size.width,
                    child: replace == false
                        ? CameraPreview(_controller)
                        : Image.file(
                            File(imageforshow!.path),
                            fit: BoxFit.contain,
                          ),
                  ),
                  Positioned(
                    bottom: 390,
                    child: Image.asset(
                      widget.contentPath1,
                      filterQuality: FilterQuality.high,
                      isAntiAlias: true,
                      height: MediaQuery.of(context).size.height * 0.68 * 0.31,
                      width: MediaQuery.of(context).size.width,
                      fit: widget.contentPath1 ==
                              "assets/jumping-jack/jumpjack.png"
                          ? BoxFit.contain
                          : BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    if (_controller != null &&
                        _controller.value.isInitialized) {
                      try {
                        await _controller.setFlashMode(FlashMode.auto);
                        imageforshow = await _controller.takePicture();
                      } on CameraException catch (e) {
                        print("Error occured while taking picture : $e");
                      }
                      setState(() {
                        isLoading = false;
                      });
                      return;
                    }
                  },
                  style: ButtonStyle(
                    elevation:
                        MaterialStateProperty.resolveWith((states) => 1.5),
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.light
                            ? MaterialStateProperty.resolveWith(
                                (states) => Colors.purpleAccent)
                            : MaterialStateProperty.resolveWith(
                                (states) => Colors.purpleAccent),
                    enableFeedback: true,
                    shape: MaterialStateProperty.resolveWith(
                      (states) => RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          15 * (MediaQuery.of(context).size.width / 411),
                        ),
                      ),
                    ),
                  ),
                  child: isLoading == false
                      ? Text(
                          "Capture",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.5 *
                                (MediaQuery.of(context).size.height / 867),
                          ),
                        )
                      : const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3.0,
                        ),
                ),
                const SizedBox(
                  width: 5,
                ),
                FilledButton(
                  onPressed: () {
                    if (imageforshow == null) return;
                    setState(() {
                      replace = !replace;
                    });
                  },
                  style: ButtonStyle(
                    elevation:
                        MaterialStateProperty.resolveWith((states) => 1.5),
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.light
                            ? MaterialStateProperty.resolveWith(
                                (states) => Colors.purple)
                            : MaterialStateProperty.resolveWith(
                                (states) => Colors.purple),
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
                    "View",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:
                          17.5 * (MediaQuery.of(context).size.height / 867),
                    ),
                  ),
                )
              ],
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (builder) => StepsPage2(
                      instructions: widget.instructions2,
                      contentPath: widget.contentPath2,
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
    );
  }
}



// Muscular Endurance: Push-up
// Muscular Strength: Plank
// Flexibility: Seat-sretch
// Cardiovascular Endurance: Jumping Jacks
