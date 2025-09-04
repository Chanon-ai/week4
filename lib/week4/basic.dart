import 'package:flutter/material.dart';

class Basic extends StatelessWidget {
  const Basic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My first app"),
        ),
        body: const Center(
          child: Text("Hello worldddddd"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            
            print("Button clicked");
          },
          child: const Text("click"),
        ),
      ),
    );
  }
}
