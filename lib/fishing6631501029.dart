// ID : 6631501029 Chanon Kaewnuch
import 'package:flutter/material.dart';
import 'dart:math';

class Fishing extends StatefulWidget {
  const Fishing({super.key});

  @override
  State<Fishing> createState() => _FishingState();
}

class _FishingState extends State<Fishing> {
  // Fish data
  List fish = [
    {
      'name': 'AnglerFish',
      'price': 20,
      'image': 'assets/images/fish/anglerfish.png',
    },
    {
      'name': 'NeonTetra',
      'price': 10,
      'image': 'assets/images/fish/neon-tetra.png',
    },
    {
      'name': 'Puffer',
      'price': 5,
      'image': 'assets/images/fish/puffer-fish.png',
    },
    {'name': 'Shark', 'price': 10, 'image': 'assets/images/fish/shark.png'},
  ];

  String img = 'assets/images/fish/fisherman.png';
  int coin = 0;
  String result = '';
  int worms = 5;

  void goFishing() {
    setState(() {
      int index = Random().nextInt(fish.length);
      img = fish[index]['image'];
      int num = 1 + Random().nextInt(5);
      worms -= 1;
      int total = fish[index]['price'] * num;
      coin += total;
      result = '${fish[index]['name']} x $num = $total coins';
    });
  }

  void resetGame() {
    setState(() {
      img = 'assets/images/fish/fisherman.png';
      result = '';
      coin = 0;
      worms = 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Fishing Game', style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text('Worms: '),
                    Row(
                      children: List.generate(
                        worms,
                        (index) =>
                            Icon(Icons.waves_outlined, color: Colors.red),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(Icons.monetization_on_outlined, color: Colors.amber),
                    SizedBox(width: 3),
                    Text('$coin'),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    img,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(result),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: worms > 0
                      ? goFishing
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    elevation: 6,
                  ),
                  child: Text('Fishing'),
                ),

                SizedBox(height: 5),
                ElevatedButton(
                  onPressed: resetGame,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    elevation: 6,
                  ),
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
