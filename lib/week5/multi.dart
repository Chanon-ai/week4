import 'package:flutter/material.dart';

class Multi extends StatelessWidget {
  const Multi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[
            Container(color: Colors.green, width: 100, height: 100),
            Container(color: Colors.yellow, width: 100, height: 200),
            Container(color: Colors.red, width: 100, height: 100),
          ],
        ),
      ),
    );
  }
}
