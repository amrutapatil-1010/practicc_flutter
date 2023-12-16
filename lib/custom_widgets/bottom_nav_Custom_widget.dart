import 'package:flutter/material.dart';

import '../dif_screens/bottom_nav_item_screen.dart';

class BottomNavCustomWidget extends StatelessWidget {
  final bool enableBottomBar;
  const BottomNavCustomWidget({required this.enableBottomBar, super.key});

  @override
  Widget build(BuildContext context) {
    return Offstage(
        offstage: !enableBottomBar,
        child: BottomNavigationBar(
          backgroundColor: Colors.pink,
          items: [
            BottomNavigationBarItem(
                icon: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const ScreenOne()));
                    },
                    child: const Icon(Icons.safety_check)),
                label: "1"),
            BottomNavigationBarItem(
                icon: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => ScreenTwo()));
                    },
                    child: const Icon(Icons.reset_tv)),
                label: "2"),
            BottomNavigationBarItem(
                icon: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => ScreenThree()));
                    },
                    child: const Icon(Icons.style)),
                label: "3")
          ],
        ));
  }
}
