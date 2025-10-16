import 'package:flutter/material.dart';
import 'second_route.dart';


class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: FilledButton(
          child: const Text('Next'),
          onPressed: () {
            // Jump to the second route
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SecondRoute(),
                settings: const RouteSettings(arguments: 'Tom'),
              ),
            );
          },
        ),
      ),
    );
  }
}

