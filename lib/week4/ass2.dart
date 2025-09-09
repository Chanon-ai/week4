import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController tcNum1 = TextEditingController();
  TextEditingController tcNum2 = TextEditingController();
  String result = "";

  void Sum() {
    setState(() {
      final num1 = int.tryParse(tcNum1.text);
      final num2 = int.tryParse(tcNum2.text);

      if (num1 == null || num2 == null) {
        result = "Please input both numbers";
      } else {
        int sum = num1 + num2;
        result = "Result = $sum";
      }
    });
  }

  void Power() {
    setState(() {
      int num1 = int.parse(tcNum1.text);
      int num2 = int.parse(tcNum2.text);
      int pow = num1;

      if (num1 == null || num2 == null) {
        result = "Please input both numbers";
      } else {
        for (int i = 1; i < num2; i++) {
          pow *= num1;
        }
        result = "Result = $pow";
      }
    });
  }

  void Clear() {
    setState(() {
      tcNum1.clear();
      tcNum2.clear();
      result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Calculator",
            style: TextStyle(
              fontSize: 28,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 48, 162, 255),
        ),

        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: tcNum1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Number 1',
                  suffixIcon: IconButton(
                    onPressed: tcNum1.clear,
                    icon: const Icon(Icons.clear),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),

              TextField(
                controller: tcNum2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Number 2',
                  suffixIcon: IconButton(
                    onPressed: tcNum2.clear,
                    icon: const Icon(Icons.clear),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),

              Column(
                children: [
                  ElevatedButton(
                    onPressed: Sum,
                    child: const Text(
                      'Sum',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 236, 205, 26),
                    ),
                  ),
                  const SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: Power,
                    child: const Text(
                      'Power',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 31, 167, 230),
                    ),
                  ),
                  const SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: Clear,
                    child: const Text(
                      'Clear',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 236, 77, 65),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Text(
                result,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 255, 0, 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
