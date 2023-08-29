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
  List<int> widgetIndex = [1, 2, 3, 4];
  Widget _buildItemList(BuildContext context, int index) {
    if (index == widgetIndex.length) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => InstructionPage(
              appBarTitle: widgetIndex[index] == 1
                  ? "Muscular Endurance"
                  : widgetIndex[index] == 2
                      ? "Muscular Strength"
                      : widgetIndex[index] == 3
                          ? "Flexibility"
                          : "Cardiovascular Endurance",
              imageNo: widgetIndex[index] == 1
                  ? "4"
                  : widgetIndex[index] == 2
                      ? "1"
                      : widgetIndex[index] == 3
                          ? "2"
                          : "3",
            ),
          ),
        );
      },
      child: Select(
        title: widgetIndex[index] == 1
            ? "Muscular Endurance"
            : widgetIndex[index] == 2
                ? "Muscular Strength"
                : widgetIndex[index] == 3
                    ? "Flexibility"
                    : "Cardiovascular Endurance",
        imagePath: widgetIndex[index] == 1
            ? "assets/4.jpg"
            : widgetIndex[index] == 2
                ? "assets/1.jpg"
                : widgetIndex[index] == 3
                    ? "assets/2.jpg"
                    : "assets/3.jpg",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.green
          : Colors.lightGreen,
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
                  fontSize: 25 * (MediaQuery.of(context).size.height / 867),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ScrollSnapList(
                  itemBuilder: _buildItemList,
                  itemSize: MediaQuery.of(context).size.width,
                  dynamicItemSize: true,
                  itemCount: widgetIndex.length,
                  onItemFocus: (int) {
                    print(MediaQuery.of(context).size.width); // width: 411
                    print(MediaQuery.of(context).size.height); // height: 867
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
