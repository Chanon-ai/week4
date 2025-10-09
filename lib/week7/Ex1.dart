import 'package:flutter/material.dart';


class CheckboxDemo extends StatefulWidget {
  const CheckboxDemo({super.key});


  @override
  State<CheckboxDemo> createState() => _CheckboxDemoState();
}


class _CheckboxDemoState extends State<CheckboxDemo> {
  bool cb = false, sw = false;


  void toggleCheckbox(bool? status) {
    setState(() {
      cb = status!;
    });
  }


  void toggleSwitch(bool? status) {
    setState(() {
      sw = status!;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox & Switch demo'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Checkbox(
                value: cb,
                onChanged: toggleCheckbox,
              ),
              Text('Checkbox: $cb'),
            ],
          ),
          Row(
            children: [
              Switch(
                value: sw,
                onChanged: toggleSwitch,
              ),
              Text('Switch: $sw'),
            ],
          ),
        ],
      ),
    );
  }
}

