import 'package:flutter/material.dart';

class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

const Color bgColor = Color(0xFF202020);
const Color primaryColor = Color(0xFFFFBD73);

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tourist Place')),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Image.asset('assets/images/clock-tower.jpg'),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Chiang Rai Clock Tower',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Chiang Rai, Thailand',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, right: 4),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: const Color.fromARGB(255, 255, 156, 64)),
                              Text('559'),
                            ],
                          ),
                        ),
                      ],
                    ),
 
                    Row( 
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Icon(Icons.phone),
                            Text('CALL')
                          ],
                        ),   Column(
                          children: [
                            Icon(Icons.phone),
                            Text('Route')
                          ],
                        ),   Column(
                          children: [
                            Icon(Icons.phone),
                            Text('Share')
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // --------------------------- Bg images-------------------------------

      //   appBar: AppBar(title: Text('Image Demo')),
      //   body: Stack(
      //     children: [
      //       Image.network(
      //         'https://i.pinimg.com/originals/2e/c6/b5/2ec6b5e14fe0cba0cb0aa5d2caeeccc6.jpg',
      //         width: double.infinity,
      //         height: double.infinity,
      //         fit: BoxFit.cover,
      //       ),

      //       Center(
      //         child: Text(
      //           'Hello World',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 32,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
    );
  }
}
