import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(home: ContainerDemo(), debugShowCheckedModeBanner: false),
  );
}

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Container Demo')),
      body: Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(5),
        color: Colors.amber[600],
        width: 100.0,
        height: 50.0,
        child: const Text('Child'),
      ),
    );
  }
}
