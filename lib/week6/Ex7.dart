import 'package:flutter/material.dart';
import 'dart:math';

class TestApp3 extends StatefulWidget {
  const TestApp3({super.key});

  @override
  State<TestApp3> createState() => _TestApp3State();
}

class _TestApp3State extends State<TestApp3> {
  Color bgColor = Colors.white;
  Color iconcolor = Colors.black;
  String status = 'Open';
  final List<Color> colors = [Colors.white, Colors.black];

  final List<String> Change = ['Close','Open'];
  int index = 0;
  int index2 = 0;
  int index3 = 0;

  void changeColor() {
    setState(() {
      index = (index + 1) % colors.length;
      index2 = (index + 1) % colors.length;
      index3 = (index + 1) % Change.length;
      bgColor = colors[index];
      iconcolor = colors[index2];
      status = Change[index3];
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
              icon: Icon(Icons.light_mode_sharp, size: 100, color: iconcolor),
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Status : $status',
            style: TextStyle(
              color: iconcolor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
