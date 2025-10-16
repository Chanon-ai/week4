import 'package:flutter/material.dart';
import 'second_route.dart';


class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: FilledButton(
          child: Text('Next'),
          onPressed: () {
            // Jump to the second route
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondRoute(),
                settings: RouteSettings(
                  arguments: <String, dynamic>{
                    'name': 'Lora',
                    'age': 19,
                    'isFemale': true,
                    'score': [10, 20, 30],
                    'grade': {'mobile': 'A', 'web': 'C+'}
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
