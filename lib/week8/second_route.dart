import 'package:flutter/material.dart';


class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});


  @override
  Widget build(BuildContext context) {
    // get data from the previous page
    // note that the arguments are Object, we need to cast to Map
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    TextStyle textStyle = const TextStyle(fontSize: 20);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Name: ${data['name']}', style: textStyle),
            Text('Age: ${data['age']}', style: textStyle),
            Text(data['isFemale'] ? 'Gender: Female' : 'Gender: Male',
                style: textStyle),
            Text('Quiz score: ${data['score'][0]}', style: textStyle),
            Text('Midterm score: ${data['score'][1]}', style: textStyle),
            Text('Final score: ${data['score'][2]}', style: textStyle),
            Text('Grade: Mobile ${data['grade']['mobile']}', style: textStyle),
            Text('Grade: Web ${data['grade']['web']}', style: textStyle),
            Center(
              child: FilledButton(
                onPressed: () {
                  //Return to previous page (first route)
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

