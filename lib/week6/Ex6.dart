import 'package:flutter/material.dart';
import 'dart:math';

class TestApp2 extends StatefulWidget {
  const TestApp2({super.key});

  @override
  State<TestApp2> createState() => _TestApp2State();
}

class _TestApp2State extends State<TestApp2> {
  Color bgColor = Colors.black;

  // void changeColor() {
  //   setState(() {
  //     bgColor = Color.fromARGB(
  //       255,
  //       Random().nextInt(256),
  //       Random().nextInt(256),
  //       Random().nextInt(256),
  //     );
  //   });
  // }

  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
  ];
  int index = 0;

  void changeColor() {
    setState(() {
      int index = Random().nextInt(colors.length);
      // index = (index + 1) % colors.length;
      bgColor = colors[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: IconButton(
              onPressed: changeColor,
              icon: Icon(Icons.color_lens_sharp, size: 100),
            ),
          ),
        ],
      ),
    );
  }
}
