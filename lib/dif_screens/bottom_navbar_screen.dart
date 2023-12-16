import 'package:flutter/material.dart';
import 'package:flutter_task/dif_screens/bottom_nav_item_screen.dart';

import '../custom_widgets/bottom_nav_Custom_widget.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home screen with Bottom Navigataion items"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
                controller: ScrollController(),
                shrinkWrap: true,
                itemCount: 500,
                itemBuilder: (context, index) {
                  return const Text("Nav bar items");
                }),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavCustomWidget(
        enableBottomBar: true,
      ),
    );
  }
}
