import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innofest_app/screens/CountdownPage.dart';

class InstructionPage extends StatefulWidget {
  final String appBarTitle;
  final String imageNo;
  const InstructionPage(
      {super.key, required this.appBarTitle, required this.imageNo});

  @override
  State<InstructionPage> createState() => _InstructionPageState();
}

class _InstructionPageState extends State<InstructionPage>
    with TickerProviderStateMixin {
  bool expanded1 = false;
  bool expanded2 = false;
  // 1
  late final AnimationController _controller1 = AnimationController(
    duration: const Duration(milliseconds: 250),
    vsync: this,
  );
  late final Animation<double> _animation1 = CurvedAnimation(
    parent: _controller1,
    curve: Curves.linear,
  );
  //2
  late final AnimationController _controller2 = AnimationController(
    duration: const Duration(milliseconds: 250),
    vsync: this,
  );
  late final Animation<double> _animation2 = CurvedAnimation(
    parent: _controller2,
    curve: Curves.linear,
  );

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 95,
        child: Visibility(
          visible: expanded1 || expanded2 == true ? false : true,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => const CountdownPage(),
                ),
              );
            },
            backgroundColor: Colors.green,
            enableFeedback: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                "Start",
                style: TextStyle(
                    fontFamily: "Avenir Roman",
                    fontSize: 25 * (MediaQuery.of(context).size.height / 867),
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300 * (MediaQuery.of(context).size.height / 867),
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/${widget.imageNo}.jpg',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            pinned: true,
            backgroundColor: widget.imageNo == "1"
                ? Colors.blueGrey[700]
                : widget.imageNo == "2"
                    ? Colors.indigo[100]
                    : Colors.brown,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 5.0),
                    child: Text(
                      widget.appBarTitle,
                      style: TextStyle(
                        fontFamily: "Avenir Roman",
                        fontSize: widget.appBarTitle ==
                                "Cardiovascular Endurance"
                            ? 30 * (MediaQuery.of(context).size.height / 867)
                            : 35 * (MediaQuery.of(context).size.height / 867),
                        color: widget.imageNo == "1"
                            ? Colors.white
                            : widget.imageNo == "2"
                                ? Colors.white
                                : widget.imageNo == "3"
                                    ? Colors.black
                                    : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: expanded1 ? 350 : 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    border: Border.all(width: 0.3, color: Colors.black87),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Information",
                              style: TextStyle(
                                  fontFamily: "Avenir Roman",
                                  color: Colors.white,
                                  fontSize: 25),
                            ),
                            const Spacer(),
                            RotationTransition(
                              turns: Tween(begin: 0.0, end: 0.5)
                                  .animate(_animation1),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 25,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    expanded1 = !expanded1;
                                    if (_controller1.status ==
                                        AnimationStatus.completed) {
                                      _controller1.reverse();
                                    } else {
                                      _controller1.forward();
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        if (expanded1 == true)
                          const Expanded(
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              style: TextStyle(
                                  fontFamily: "Avenir Medium",
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: expanded2 ? 350 : 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    border: Border.all(width: 0.3, color: Colors.black87),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Instructions",
                              style: TextStyle(
                                  fontFamily: "Avenir Roman",
                                  color: Colors.white,
                                  fontSize: 25),
                            ),
                            const Spacer(),
                            RotationTransition(
                              turns: Tween(begin: 0.0, end: 0.5)
                                  .animate(_animation2),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 25,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    expanded2 = !expanded2;
                                    if (_controller2.status ==
                                        AnimationStatus.completed) {
                                      _controller2.reverse();
                                    } else {
                                      _controller2.forward();
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        if (expanded2 == true)
                          const Expanded(
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              style: TextStyle(
                                  fontFamily: "Avenir Medium",
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
