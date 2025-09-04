import 'package:flutter/material.dart';

// st
class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  int count = 0;

  void update(){
     // debugPrint("message");
    setState(() {
      count++;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Counter App" ,style: TextStyle(fontSize: 35 , color: Color.fromARGB(255, 0, 0, 0))) , backgroundColor: const Color.fromARGB(143, 255, 0, 0)),

        body: Center(
          child: Text(
          'Count: $count', style: TextStyle(fontSize: 26 , color: const Color.fromARGB(255, 255, 77, 0))
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: update,

          child: Text("Click"),
        ),
      ),
    );
  }
}
