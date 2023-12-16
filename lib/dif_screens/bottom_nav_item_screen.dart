import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../custom_widgets/bottom_nav_Custom_widget.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Page 1"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                controller: ScrollController(),
                shrinkWrap: true,
                itemCount: 500,
                itemBuilder: (context, index) {
                  return const Text("Page 1");
                }),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
      bottomNavigationBar: const BottomNavCustomWidget(
        enableBottomBar: true,
      ),
    );
  }
}

class ScreenTwo extends StatelessWidget {
  ScreenTwo({super.key});
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("Page 2"),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  controller: _controller,
                  shrinkWrap: true,
                  itemCount: 500,
                  itemBuilder: (context, index) {
                    return const Text("Page 2");
                  }),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
        bottomNavigationBar: const BottomNavCustomWidget(
          enableBottomBar: true,
        ));
  }
}

class ScreenThree extends StatefulWidget {
  ScreenThree({super.key});

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  ScrollController scrollController = ScrollController();
  bool isVisible = true;
  List names = [
    "abc",
    "def",
    "ghi",
    "jkl",
  ];
  List subListOne = [
    "list 1",
    "list 1",
    "list 1",
    "list 1",
    "list 1",
    "list 1"
  ];

  List subListTwo = [
    "list 2",
    "list 2",
    "list 2",
    "list 2",
    "list 2",
    "list 2",
    "list 2",
  ];

  List subListThree = [
    "list 3",
    "list 3",
    "list 3",
    "list 3",
    "list 3",
    "list 3",
    "list 3",
    "list 3",
  ];
  List subListFour = [
    "list 4",
    "list 4",
    "list 4",
    "list 4",
    "list 4",
    "list 4",
    "list 4",
    "list 4",
  ];
  bool enableSubList = false;
  List subList = [];

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          isVisible = false;
        });
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!isVisible) {
          setState(() {
            isVisible = true;
          });
        }
      }
    });
    super.initState();
  }

  void onClickMainList(int index) {
    enableSubList = false;
    subList.clear();
    subList = index == 0
        ? subListOne
        : index == 1
            ? subListTwo
            : index == 2
                ? subListThree
                : subListFour;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Page 3"),
        ),
        drawer: Drawer(
            backgroundColor: Colors.green,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                    1,
                    (index) => Column(
                          children: [
                            SizedBox(
                              height: index == 0 ? 50 : 10,
                            ),
                            Container(
                              height: 40,
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.black)),
                              ),
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        onClickMainList(index);
                                      },
                                      child: Row(
                                        children: [
                                          Expanded(child: Text(names[0])),
                                          const Icon(
                                              Icons.arrow_downward_rounded),
                                        ],
                                      )),
                                  if (subList.isNotEmpty)
                                    Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey)),
                                        ),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: subList.length,
                                                  itemBuilder:
                                                      (context, subIndex) {
                                                    return Text(
                                                        "${subList[subIndex]}");
                                                  })
                                            ]))
                                ],
                              ),
                            ),
                          ],
                        )))),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  controller: scrollController,
                  shrinkWrap: true,
                  itemCount: 500,
                  itemBuilder: (context, index) {
                    return const Text("Page 3");
                  }),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
        bottomNavigationBar: AnimatedContainer(
          padding: EdgeInsets.zero,
          duration: const Duration(milliseconds: 200),
          height: isVisible ? 120 : 0,
          child: BottomNavigationBar(
            backgroundColor: Colors.amber[200],
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.child_friendly),
                label: "child",
              ),
            ],
          ),
        ));

    // // const BottomNavCustomWidget(
    //   enableBottomBar: true,
    // ),
  }
}
