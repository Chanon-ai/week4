import 'package:flutter/material.dart';

class Papaya extends StatefulWidget {
  const Papaya({super.key});

  @override
  State<Papaya> createState() => _PapayaState();
}

const Color Bgcolor = Color.fromARGB(255, 52, 42, 197);
const Color icon1 = Color.fromARGB(255, 107, 55, 5);
const Color icon2 = Color.fromARGB(255, 199, 49, 38);
const Color icon3 = Color.fromARGB(255, 0, 0, 0);
const String reviews = '3128 reviews';

class _PapayaState extends State<Papaya> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Bgcolor,
        title: Text('Cooking Recipes', style: TextStyle(color: Colors.white)),
      ),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Papaya Salad',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Flexible(
                    Expanded(
                      flex: 3,

                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Bgcolor),
                        ),
                        child: Text(
                          'Lorem ipsum dolor sit amet, dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                        ),
                      ),
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/images/salad.jpg',
                              width: 160,
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star, color: Colors.amber),
                                Icon(
                                  Icons.star,
                                  color: const Color.fromARGB(255, 83, 82, 81),
                                ),
                              ],
                            ),
                          ),
                          Text(reviews),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Icon(Icons.timelapse, color: icon1),
                                  Text('PREP:', style: TextStyle(color: icon1)),
                                  Text(
                                    '5 mins',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: icon1,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(Icons.timer, color: icon2),
                                  Text('COOK:', style: TextStyle(color: icon2)),
                                  Text(
                                    '10 mins',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: icon2,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(Icons.fastfood_outlined, color: icon3),
                                  Text(
                                    'FEEDS:',
                                    style: TextStyle(color: icon3),
                                  ),
                                  Text(
                                    '1-3',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: icon3,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
