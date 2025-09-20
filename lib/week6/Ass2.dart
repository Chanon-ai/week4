import 'package:flutter/material.dart';
import 'dart:async';

class GameClick extends StatefulWidget {
  const GameClick({super.key});

  @override
  State<GameClick> createState() => _GameClickState();
}

const Color bgColor = Colors.white;

class _GameClickState extends State<GameClick> {
  double count = 1;
  Timer? _timer;

  void countdown(Timer timer) {
    setState(() {
      if (count > 0) {
        count = (count - 0.01).clamp(0.0, 5.0);
      }
      if (count <= 0) {
        timer.cancel();
      }
    });
  }

  void startTimer() {
    _timer?.cancel();
    setState(() {
      count = 1.00;
    });
    _timer = Timer.periodic(const Duration(milliseconds: 10), countdown);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              count.toStringAsFixed(2),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text('Click = ', style: TextStyle(fontSize: 40)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: startTimer,
                  style: TextButton.styleFrom(
                    foregroundColor: bgColor,
                    iconColor: bgColor,
                    backgroundColor: const Color.fromARGB(255, 70, 219, 75),
                   
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
                  onPressed: startTimer,
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 238, 49, 49),
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
