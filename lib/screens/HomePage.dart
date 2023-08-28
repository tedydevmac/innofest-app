import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innofest_app/components/Selection.dart';
import 'package:innofest_app/screens/InstructionPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "WorkBud",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: "Avenir Medium",
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const InstructionPage(
                            appBarTitle: "Exercise 1",
                            imageNo: "1",
                          ),
                        ),
                      );
                    },
                    child: const Select(
                      imagePath: 'assets/1.jpg',
                      title: "Exercise 1",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const InstructionPage(
                            appBarTitle: "Exercise 2",
                            imageNo: "2",
                          ),
                        ),
                      );
                    },
                    child: const Select(
                      imagePath: 'assets/2.jpg',
                      title: "Exercise 2",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const InstructionPage(
                            appBarTitle: "Exercise 3",
                            imageNo: "3",
                          ),
                        ),
                      );
                    },
                    child: const Select(
                      imagePath: 'assets/3.jpg',
                      title: "Exercise 3",
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
