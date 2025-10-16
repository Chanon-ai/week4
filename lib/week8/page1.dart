import 'package:flutter/material.dart';
import 'package:flutter_application_1/week8/page2.2.dart';


class FirstRoute3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ElevatedButton(
          child: Text('Next'),
          onPressed: () {
            // Jump to the second route
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => SecondRoute(),
            //       settings: RouteSettings(arguments: 'Tom')),
            // );
            // If you have many previous routes and want to delete them all
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => SecondPage(),
                settings: RouteSettings(arguments: 'Tom222'),
              ),
              (route) => false,
            );
          },
        ),
      ),
    );
  }
}
