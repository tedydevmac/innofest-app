import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:innofest_app/main.dart';
import 'package:innofest_app/screens/HomePage.dart';

class StepsPage2 extends StatefulWidget {
  const StepsPage2({
    super.key,
    required this.instructions,
    required this.contentPath,
  });
  final String instructions;
  final String contentPath;

  @override
  State<StepsPage2> createState() => _StepsPage2State();
}

class _StepsPage2State extends State<StepsPage2> {
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
                widget.instructions,
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
                    height: MediaQuery.of(context).size.height * 0.68 * 0.65,
                    width: MediaQuery.of(context).size.width,
                    child: replace == false
                        ? CameraPreview(_controller)
                        : Image.file(
                            File(imageforshow!.path),
                            fit: BoxFit.contain,
                          ),
                  ),
                  Positioned(
                    bottom: 430,
                    child: Image.asset(
                      widget.contentPath,
                      filterQuality: FilterQuality.high,
                      isAntiAlias: true,
                      height: MediaQuery.of(context).size.height * 0.68 * 0.31,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
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
                int? temp = prefs!.getInt('budpoints');
                temp ??= 0;
                prefs!.setInt("budpoints", temp += 1);
                Navigator.of(context).push(
                    CupertinoPageRoute(builder: (builder) => const HomePage()));
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
