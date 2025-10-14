import 'package:flutter/material.dart';

class CoffeeApp extends StatefulWidget {
  const CoffeeApp({super.key});

  @override
  State<CoffeeApp> createState() => _CoffeeAppState();
}

class _CoffeeAppState extends State<CoffeeApp> {
  bool hot = true;
  double sugar = 2;
  final List<String> sugars = ['none', 'less', 'normal'];

  void switch1(bool value) {
    setState(() {
      hot = value;
    });
  }

  void order(BuildContext context) {
    String sugarText = (sugars[sugar.round()] == 'none')
        ? 'no'
        : '${sugars[sugar.round()]}';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Your order'),
          content: Text(
            '${hot ? 'Cold' : 'Hot'} coffee with $sugarText sugar',
            style: const TextStyle(fontSize: 12),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[800],
        title: const Text(
          'MFU Coffee Shop',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              const Center(
                child: Text('Your order', style: TextStyle(fontSize: 26)),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Type'),
                  Row(
                    children: [
                      const Text('Hot'),
                      Switch(value: hot, onChanged: switch1),
                      const Text('Cold'),
                    ],
                  ),
                ],
              ),

              Row(
                children: [
                  const Text('Sugar level'),
                  Expanded(
                    child: Slider(
                      value: sugar,
                      min: 0,
                      max: (sugars.length - 1).toDouble(),
                      divisions: sugars.length - 1,
                      label: sugars[sugar.round()],
                      onChanged: (value) {
                        setState(() {
                          sugar = value;
                        });
                      },
                    ),
                  ),
                  Text('Normal'),
                ],
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[800],
                ),
                onPressed: () => order(context),
                child: const Text(
                  'ORDER',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
