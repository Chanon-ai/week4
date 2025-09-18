import 'dart:math' as math;
import 'package:flutter/material.dart';

class GuessGame extends StatefulWidget {
  const GuessGame({super.key});

  @override
  State<GuessGame> createState() => _GuessGameState();
}

class _GuessGameState extends State<GuessGame> {
  final TextEditingController controller = TextEditingController();
  late int Number;
  int chances = 3;
  String result = '';
  bool GameOver = false;

  @override
  void initState() {
    super.initState();
    reset();
  }

  void reset() {
    Number = math.Random().nextInt(10);
    chances = 3;
    result = '';
    GameOver = false;
    controller.clear();
    setState(() {});
  }

  void check() {
    int? guess = int.tryParse(controller.text);

    if (guess == null || guess < 0 || guess > 9) {
      setState(() {
        result = 'Please enter a number 0–9';
      });
      return;
    }

    if (chances <= 0) return;

    setState(() {
      if (guess == Number) {
        result = 'Correct, you win!';
        GameOver = true;
      } else {
        chances--;
        if (chances == 0) {
          result = 'Sorry, you lose. The answer is $Number';
          GameOver = true;
        } else if (guess < Number) {
          result = '$guess is too small, $chances chance(s) left!';
        } else {
          result = '$guess is too large, $chances chance(s) left!';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Guess a number game', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 16),

              TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                enabled: !GameOver,
                decoration: const InputDecoration(
                  hintText: 'Guess a number 0–9',
                ),
              ),
              const SizedBox(height: 16),

              Text(
                result,
                style: const TextStyle(color: Colors.red, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              FilledButton(
                onPressed: GameOver ? reset : check,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(0, 255, 255, 255),
                  ), 
                  side: MaterialStateProperty.all(
                    const BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0),
                      width: 1,
                    ),
                  ), 
                ),
                child: Text(
                  GameOver ? 'Replay' : 'Guess',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 149, 50, 199),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
