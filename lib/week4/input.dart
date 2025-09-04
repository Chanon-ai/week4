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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: tcName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your name',
                  suffixIcon: IconButton(onPressed: tcName.clear , icon: Icon(Icons.clear)),
                ),
              ),
            ),
            // SizedBox(height: 20),
            ElevatedButton(onPressed: updateMessage, child: Text('OK')),
            SizedBox(height: 20),
            Text(message, style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
