import 'package:flutter/material.dart';

// st
class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  String message = "Hello";

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Counter App")),

        body: Text(message),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // debugPrint("message");
            setState(() {
               message = message == "Hello" ? "Hi" : "Hello";
            });
          },

          child: Text("Click"),
        ),
      ),
    );
  }
}
