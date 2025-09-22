import 'package:flutter/material.dart';

class Wikipedia extends StatefulWidget {
  const Wikipedia({super.key});

  @override
  State<Wikipedia> createState() => _WikipediaState();
}

const Color bgColor = Color.fromARGB(255, 15, 88, 148);
const Color IconColor = Colors.blue;

class _WikipediaState extends State<Wikipedia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text('Tourist Place', style: TextStyle(color: Colors.white)),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentGeometry.bottomCenter,
            heightFactor: 1,
            child: Image.asset('assets/images/clock-tower.jpg'),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chiang Rai Clock Tower',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text('Chiang Rai, Thailand'),
                    Spacer(),
                    Icon(Icons.star, color: Colors.amber[900]),
                    Text('559'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.call, color: IconColor),
                          Text('CALL', style: TextStyle(color: IconColor)),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.assistant_direction,
                            size: 30,
                            color: IconColor,
                          ),
                          Text('ROUTE', style: TextStyle(color: IconColor)),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.share, color: IconColor),
                          Text('SHARE', style: TextStyle(color: IconColor)),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  'Content.....................................................................................................................................',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
