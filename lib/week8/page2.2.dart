import 'package:flutter/material.dart';


class SecondPage extends StatelessWidget {
  const SecondPage({super.key});


  @override
  Widget build(BuildContext context) {
    String name = ModalRoute.of(context)!.settings.arguments as String;


    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 16),
        child: Text('Welcome $name'),
      ),
    );
  }
}
