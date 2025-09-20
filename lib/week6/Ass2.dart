import 'package:flutter/material.dart';
import 'dart:async';

class GameClick extends StatefulWidget {
  const GameClick({super.key});

  @override
  State<GameClick> createState() => _GameClickState();
}

const Color bgColor = Color.fromARGB(255, 255, 223, 223);

class _GameClickState extends State<GameClick> {
  double count = 1.00;
  int Click = 0;
  Timer? _timer;
  bool Playing = false;
  void countdown(Timer timer) {
    setState(() {
      if (count > 0) {
        count = (count - 0.01).clamp(0.0, 5.0);
      }
      if (count <= 0) {
        timer.cancel();
         Playing = false;
      }
    });
  }

  
  void play() {
    if (Playing) return;
    _timer?.cancel();
    setState(() {
      count = 1.0;
      Click = 0;
      Playing = true;
    });
    _timer = Timer.periodic(const Duration(milliseconds: 10), countdown);
  }

  void clickbut() {
    if (!Playing || count <= 0) return;
    setState(() {
      Click += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              count.toStringAsFixed(2),
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.red,
                fontSize: 20,
              ),
            ),

            Text('Click = $Click', style: TextStyle(fontSize: 40)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: Playing ? clickbut : null,
                  style: TextButton.styleFrom(
                    foregroundColor: bgColor,
                    iconColor: bgColor,
                    backgroundColor: const Color.fromARGB(255, 85, 170, 87),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: const [
                        Icon(Icons.ads_click),
                        SizedBox(width: 8),
                        Text('Click'),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: 10),
                TextButton(
                  onPressed: play,
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 209, 62, 62),
                    iconColor: Colors.black,
                    backgroundColor: bgColor,
                    side: const BorderSide(color: Colors.black, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: const [
                        Icon(Icons.replay),
                        SizedBox(width: 8),
                        Text('Play'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
