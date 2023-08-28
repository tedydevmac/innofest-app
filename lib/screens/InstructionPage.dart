import 'package:flutter/material.dart';

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
  bool expanded3 = false;
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/${widget.imageNo}.jpg',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              "Exercise ${widget.imageNo}",
              style: const TextStyle(fontFamily: "Avenir Roman"),
            ),
            centerTitle: true,
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
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
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
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
                          )
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
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
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
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: MaterialButton(
                          onPressed: () {},
                          color: Colors.green[500],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                          child: const Text(
                            "Start",
                            style: TextStyle(
                                fontFamily: "Avenir Medium",
                                fontSize: 23,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* 

AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              iconSize: 23,
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
        ),
        title: Text(
          widget.appBarTitle,
          style: const TextStyle(fontFamily: "Avenir Roman", fontSize: 24),
        ),
      ),

SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: expanded ? 200 : 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RotationTransition(
                              turns: Tween(begin: 0.0, end: 0.5)
                                  .animate(_animation),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 25,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    expanded = !expanded;
                                    if (_controller.status ==
                                        AnimationStatus.completed) {
                                      _controller.reverse();
                                    } else {
                                      _controller.forward();
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
*/

class _CustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double height;
  final Widget child;

  _CustomHeaderDelegate({
    required this.height,
    required this.child,
  });

  @override
  double get minExtent => height;
  @override
  double get maxExtent => height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.fromSize(
      size: Size.fromHeight(height),
      child: child,
    );
  }

  @override
  bool shouldRebuild(_CustomHeaderDelegate oldDelegate) {
    return height != oldDelegate.height || child != oldDelegate.child;
  }
}
