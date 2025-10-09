import 'package:flutter/material.dart';


class SliderDemo extends StatefulWidget {
  const SliderDemo({super.key});


  @override
  State<SliderDemo> createState() => _SliderDemoState();
}


class _SliderDemoState extends State<SliderDemo> {
  double sliderValue1 = 0.5;
  double sliderValue2 = 20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text('Default Slider'),
            Slider(
              value: sliderValue1,
              divisions: 10, //Split 0.0-1.0 to 10 intervals
              label: sliderValue1.toString(),
              onChanged: (value) {
                setState(() {
                  sliderValue1 = value;
                });
              },
            ),
            const Text('Custom Slider'),
            Slider(
              min: 0,
              max: 100,
              value: sliderValue2,
              divisions:
                  5, //Split 0-100 to 5 intervals -> 0, 20, 40, 60, 80, 100
              label:
                  sliderValue2.round().toString(), // to show when slide changes
              onChanged: (value) {
                setState(() {
                  sliderValue2 = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
