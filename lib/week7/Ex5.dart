import 'package:flutter/material.dart';


class AlertDialogDemo extends StatefulWidget {
  const AlertDialogDemo({super.key});
  @override
  State<AlertDialogDemo> createState() => _AlertDialogDemoState();
}


class _AlertDialogDemoState extends State<AlertDialogDemo> {
  String ans = 'Click a button to choose';


  void show() async {
    String? answer = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Is this a hero?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
                  SizedBox(height: 14,),
              Image.asset('assets/images/fish/fisherman.png', width: 200, height: 200),
              SizedBox(height: 14,),
              const Text('FISHERMAN', style: TextStyle(color: Color.fromARGB(255, 154, 121, 13),fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('no');
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('yes');
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );


    // check the answer from the dialog
    if (answer != null) {
      setState(() {
        ans = 'Your answer is $answer';
      });
    } else {
      setState(() {
        ans = 'You select nothing';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Dialog'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            FilledButton(
              onPressed: show,
              child: const Text('dialog'),
            ),
            const SizedBox(width: 10),
            Text(ans),
          ],
        ),
      ),
    );
  }
}

