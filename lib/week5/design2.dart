import 'package:flutter/material.dart';

class Design2 extends StatelessWidget {
  const Design2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      
      backgroundColor: Colors.grey[800],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
             SizedBox(height: 16),
          Center(
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blue,
              backgroundImage: NetworkImage(
                'https://icons.iconarchive.com/icons/iconshock/super-heroes-sigma/256/Batman-icon.png',
              ),
            ),
          ),
          Divider(color: Colors.grey, height: 50),
          Text('Name', style: TextStyle(color: Colors.grey[400])),
          Text(
            'John doe',
            style: TextStyle(color: Colors.yellow, fontSize: 22),
          ),

          SizedBox(height: 16),
          Text('Age', style: TextStyle(color: Colors.grey[400])),
          Text('22', style: TextStyle(color: Colors.yellow, fontSize: 22)),

          SizedBox(height: 16),
          
          Row(children: [Icon(Icons.email, color: Colors.grey),
          SizedBox(width: 8),
          Text('johndoe@gmail.com', style: TextStyle(color: Colors.grey[400])),
          ]),
        ],
      ),
    );
  }
}
