import 'package:flutter/material.dart';

class Multi extends StatelessWidget {
  const Multi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // children:[
          //   Container(color: Colors.green, width: 100, height: 100),
          //   Spacer(flex: 2),
          //   Container(color: Colors.yellow, width: 100, height: 200),
          //   Spacer(flex: 1,),
          //   Container(color: Colors.red, width: 100, height: 100),
          // ],
          children: [
            Expanded(
              flex: 2,
              child: Container(color: Colors.green, width: 100, height: 100),
            ),
            Container(color: Colors.yellow, width: 100, height: 200),
            Expanded(
             flex: 1,
              child: Container(color: Colors.red, width: 100, height: 100),
            ),
          ],
        ),
      ),
    );
  }
}
