import 'package:flutter/material.dart';

class TestInput extends StatefulWidget {
  const TestInput({super.key});

  @override
  State<TestInput> createState() => _TestInputState();
}

class _TestInputState extends State<TestInput> {
  String result = '0';
  TextEditingController tcNum1 = TextEditingController();
  TextEditingController tcNum2 = TextEditingController();

  void plus() {
    setState(() {
      int Num1 = int.tryParse(tcNum1.text) ?? 0;
      int Num2 = int.tryParse(tcNum2.text) ?? 0;

      result = (Num1 + Num2).toString();
      ;
    });
  }

  void clear() {
    setState(() {
      tcNum1.clear();
      tcNum2.clear();
      result = '0';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: tcNum1,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'First number'),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  ' + ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                controller: tcNum2,
                keyboardType: TextInputType.number,
                obscureText: false,
                maxLength: 5,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.blue),
                decoration: InputDecoration(
                  labelText: 'Second number',
                  hintText: 'กรอกเลข',
                  prefixIcon: Icon(Icons.numbers),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                  helperText: 'ใส่ได้ไม่เกิน 5 หลัก',
                ),
                onChanged: (value) {
                  print("กำลังพิมพ์: $value");
                },
                onSubmitted: (value) {
                  print("กด Enter: $value");
                },
              ),
              SizedBox(height: 14),
              ElevatedButton(
                onPressed: plus,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.purple,
                  elevation: 6,
                  shadowColor: Colors.red,
                ),
                child: const Text('Plus'),
              ),
              SizedBox(height: 14),
              Ink(
                decoration: const ShapeDecoration(
                  shape: CircleBorder(
                    side: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                child: IconButton(
                  icon: const Icon(Icons.cleaning_services_outlined),
                  color: const Color.fromARGB(255, 15, 155, 211),
                  onPressed: clear,
                ),
              ),

              SizedBox(height: 40),
              Text(
                'Result = $result',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
