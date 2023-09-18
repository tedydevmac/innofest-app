import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innofest_app/screens/IntroductoryPage.dart';
import 'package:square_progress_bar/square_progress_bar.dart';
import 'package:innofest_app/main.dart';

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
        width: 95 * (MediaQuery.of(context).size.width / 411),
        child: Visibility(
          visible: expanded1 || expanded2 == true ? false : true,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => IntroductoryPage(
                    pageIndex: int.parse(widget.imageNo),
                  ),
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
                    fontSize: 23 * (MediaQuery.of(context).size.height / 867),
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
                'assets/splashhome/${widget.imageNo}.jpg',
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
                          Expanded(
                            child: Text(
                              int.parse(widget.imageNo) == 1
                                  ? "Planking is a form of muscular strength exercise which aids in activating core muscles within your body such as your transversus abdominis."
                                  : int.parse(widget.imageNo) == 2
                                      ? "Seat-stretching is a flexibility exercise which helps work muscles such as your glutes and lower back muscles, improving overall flexibility and balance. "
                                      : int.parse(widget.imageNo) == 3
                                          ? "Jumping Jacks are a form of cardiovascular endurance exercise which targets all major lower body muscles, primarily targeting the calves, quadriceps and shoulders."
                                          : "Push Up is a form of muscular endurance exercise which helps to build muscles responsible for muscular strength such as triceps, pectoral muscles, and shoulders. ",
                              style: const TextStyle(
                                  fontFamily: "Avenir Medium",
                                  fontSize: 20,
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
                            child: SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Throughout the instructions, there will be an animation or image provided to learn how to do the respective exercises, a camera preview will be provided to allow you to see your exercise form while following the instructions. There will be two buttons, 'Capture' and 'View', where 'Capture' lets you take a picture of your form and 'View' lets you view the image you captured. When pressing the 'Capture' button, you may need to wait a few seconds after pressing the button to allow your device to capture.",
                                  style: TextStyle(
                                      fontFamily: "Avenir Medium",
                                      fontSize: 18,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 75,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SquareProgressBar(
                    progress: (prefs!.getInt("budpoints")! / 100),
                    width: 150,
                    height: 150,
                    isAnimation: true,
                    solidBarColor: Colors.green,
                    emptyBarColor: Colors.lightGreen.withOpacity(0.2),
                    strokeWidth: 20,
                    barStrokeCap: StrokeCap.square,
                    gradientBarColor: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: <Color>[Colors.lightGreen, Colors.green],
                      tileMode: TileMode.repeated,
                    ),
                    child: Center(
                      child: Text(
                        "${((prefs!.getInt("budpoints")! / prefs!.getInt("budgoal")!) * 100).toStringAsFixed(2)}%",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Goal: ",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                      children: [
                        TextSpan(
                          text: "${prefs!.getInt("budgoal")}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
