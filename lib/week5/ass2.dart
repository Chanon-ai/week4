import 'package:flutter/material.dart';

class Summation extends StatefulWidget {
  const Summation({super.key});

  @override
  State<Summation> createState() => _SummationState();
}

class _SummationState extends State<Summation> {
  String result = '';
  TextEditingController tcNum1 = TextEditingController();
  TextEditingController tcNum2 = TextEditingController();

  void Clear() {
    setState(() {
      tcNum1.clear();
      tcNum2.clear();
      result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: tcNum1,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'First number',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(" + ", style: TextStyle(fontSize: 20)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: tcNum2,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Second number',
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      int? num1 = int.tryParse(tcNum1.text);
                      int? num2 = int.tryParse(tcNum2.text);
                      if (num1 == null || num2 == null) {
                        setState(() {
                          result = 'Incorrect input';
                        });
                        return;
                      }
                      int num = num1 + num2;
                      setState(() {
                        result = 'Result = $num';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 50, 148, 240),
                    ),
                    child: const Text(
                      'Calculate',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: Clear,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 236, 77, 65),
                    ),
                    child: const Text(
                      'Clear',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              Text(
                result,
                style: const TextStyle(color: Colors.red, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
