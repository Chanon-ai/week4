import 'package:flutter/material.dart';


class SecondRoute2 extends StatelessWidget {
  SecondRoute2({super.key});
  final TextStyle textStyle = const TextStyle(fontSize: 18);
  final TextEditingController tcName = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: tcName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your name',
              ),
            ),
            FilledButton(
              onPressed: () {
                //Return to previous page with data
                Navigator.pop(context, tcName.text);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
