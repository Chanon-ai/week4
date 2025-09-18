import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Assignment1 extends StatelessWidget {
  const Assignment1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 135, 179),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              'Wedding Organiger',
              style: GoogleFonts.sevillana(
                textStyle: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 36,
                ),
              ),
            ),
            Text(
              'Pre-wedding, Photo, Party',
              style: GoogleFonts.sevillana(
                textStyle: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 22,
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 218, 77, 67),
              ),
              child: const Text(
                'Our services',
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: const Text(
          '345 Moo 1 Tasud Chiang Rai, Thailand',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 14),
          
        ),
      ),
      
    );
  }
}
