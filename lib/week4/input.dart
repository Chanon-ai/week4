import 'package:flutter/material.dart';

class InputDemo extends StatefulWidget {
  const InputDemo({super.key});

  @override
  State<InputDemo> createState() => _InputDemoState();
}

class _InputDemoState extends State<InputDemo> {
  @override
  int count = 0;
  String message = "";

  void updateMessage(String str) {
    // whenever user type something, update state variable
    setState(() {
      message = str;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Input Demo",
            style: TextStyle(fontSize: 35, color: Color.fromARGB(255, 0, 0, 0)),
          ),
          backgroundColor: const Color.fromARGB(143, 255, 0, 0),
        ),

        body: Column(
          children: [
            TextField(
              onChanged: (String str) => updateMessage(str)
            ),
            Text(message),
          ],
        ),
      ),
    );
  }
}
