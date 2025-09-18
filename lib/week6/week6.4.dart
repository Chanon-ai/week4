import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Papaya()));
}

const Color bgColor = Color(0xFF202020);
const Color primaryColor = Color(0xFFFFBD73);

class Papaya extends StatelessWidget {
  const Papaya({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 109, 28, 159),
        title: Text(
          'Cooking Recipes',
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 28,
          ),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Papaya Salad',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Expanded(child: Column(children: [Text('lorem')])),
          ),
        ],
      ),
    );
  }
}
