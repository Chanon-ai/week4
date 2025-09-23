import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://icons.iconarchive.com/icons/kidaubis-design/cool-heroes/128/Ironman-icon.png',
                ),
                radius: 50,
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 14),
            Text(
              'Iron man',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'FLUTTER DEVERLOPER',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 14),

            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(right: 8, left: 8),
              child: const Row(
                children: [
                  Icon(Icons.phone, color: Colors.teal),
                  SizedBox(width: 8),
                  Text('+66 012 345 6789'),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: const Row(
                children: [
                  Icon(Icons.mail, color: Colors.teal),
                  SizedBox(width: 8),
                  Text('iron.man@mfu.ac.th'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
