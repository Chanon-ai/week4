import 'package:flutter/material.dart';

class InputDemo extends StatefulWidget {
  const InputDemo({super.key});

  @override
  State<InputDemo> createState() => _InputDemoState();
}

class _InputDemoState extends State<InputDemo> {
  @override
  String message = "";
  TextEditingController tcName = TextEditingController();

  void updateMessage() {
    setState(() {
      message = tcName.text;
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
            TextField(controller: tcName,),
            ElevatedButton(onPressed: updateMessage, child: Text('OK')),
            Text(message),
          ],
        ),
      ),
    );
  }
}
