import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innofest_app/components/Selection.dart';
import 'package:innofest_app/screens/InstructionPage.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> data = [1, 2, 3, 4];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.green
            : Colors.lightGreen,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "WorkBud",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  fontFamily: "Avenir Medium",
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.white
                      : Colors.black),
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
                            appBarTitle: "Muscular Endurance",
                            imageNo: "4",
                          ),
                        ),
                      );
                    },
                    child: const Select(
                      imagePath: 'assets/4.jpg',
                      title: "Muscular Endurance",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const InstructionPage(
                            appBarTitle: "Muscular Strength",
                            imageNo: "1",
                          ),
                        ),
                      );
                    },
                    child: const Select(
                      imagePath: 'assets/1.jpg',
                      title: "Muscular Strength",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const InstructionPage(
                            appBarTitle: "Flexibility",
                            imageNo: "2",
                          ),
                        ),
                      );
                    },
                    child: const Select(
                      imagePath: 'assets/2.jpg',
                      title: "Flexibility",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const InstructionPage(
                            appBarTitle: "Cardiovascular Endurance",
                            imageNo: "3",
                          ),
                        ),
                      );
                    },
                    child: const Select(
                      imagePath: 'assets/3.jpg',
                      title: "Cardiovascular Endurance",
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
