import 'package:flutter/material.dart';


class DropdownDemo extends StatefulWidget {
  const DropdownDemo({super.key});


  @override
  State<DropdownDemo> createState() => _DropdownDemoState();
}


class _DropdownDemoState extends State<DropdownDemo> {
  String _ddvalue = 'all';
  List<String> years = ['all', '2025', '2024'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dropdown button')),
      body: Center(
        child: Column(
          children: [
            DropdownButton(
              value: _ddvalue,
              items: const [
                DropdownMenuItem(value: 'all', child: Text('All years')),
                DropdownMenuItem(value: '2025', child: Text('2025')),
                DropdownMenuItem(value: '2024', child: Text('2024')),
              ],
              onChanged: (String? newvalue) {
                setState(() {
                  _ddvalue = newvalue!;
                });
              },
            ),
            const SizedBox(height: 16),
            Text('You select $_ddvalue'),
          ],
        ),
      ),
    );
  }
}

