import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_task/dif_screens/bottom_navbar_screen.dart';
import 'package:flutter_task/dif_screens/horizantal_img_scroll_animation.dart';
import 'package:password_strength_checker/password_strength_checker.dart';

class AutomaticPassGeneratorScreen extends StatefulWidget {
  const AutomaticPassGeneratorScreen({super.key});

  @override
  State<AutomaticPassGeneratorScreen> createState() =>
      _AutomaticPassGeneratorScreenState();
}

class _AutomaticPassGeneratorScreenState
    extends State<AutomaticPassGeneratorScreen> {
  String allChars = '';
  String pass = '';
  double sliderVal = 0;
  final passNotifier = ValueNotifier<PasswordStrength?>(null);
  void generatePassword(int passLength) {
    final random = Random();
    for (int i = 45; i < 57; i++) {
      allChars += String.fromCharCode(i);
    }
    for (int i = 65; i <= 90; i++) {
      allChars += String.fromCharCode(i);
    }

    for (int i = 97; i < 122; i++) {
      allChars += String.fromCharCode(i);
    }

    String specialCharacters = '!@#\$%^&*()_+:';
    allChars += specialCharacters;

    pass = '';
    for (int i = 0; i < sliderVal; i++) {
      pass += allChars[random.nextInt(allChars.length)];
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Automatic password generator screen"),
        backgroundColor: const Color.fromARGB(255, 191, 157, 197),
      ),
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Slider(
            value: sliderVal,
            max: 10,
            divisions: 5,
            onChanged: (double value) => setState(() {
                  sliderVal = value;
                  generatePassword(sliderVal.toInt());
                  passNotifier.value = PasswordStrength.calculate(text: pass);
                })),
        Text(
          pass,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: PasswordStrengthChecker(
            strength: passNotifier,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton.icon(
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => HorizontalImgScrollAnimation())
              //         );
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomNavBarScreen(),
                  ));
            },
            icon: Icon(Icons.animation),
            label: Text("abc"))
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() {
                generatePassword(sliderVal.toInt());
              }),
          tooltip: "reset",
          child: const Icon(Icons.restore_page)),
    );
  }
}
