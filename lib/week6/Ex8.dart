import 'dart:math';
import 'package:flutter/material.dart';

class RandomCard extends StatefulWidget {
  const RandomCard({super.key});

  @override
  State<RandomCard> createState() => _RandomCardState();
}

class _RandomCardState extends State<RandomCard> {
  String img = '';

  final List<String> images = [
    'assets/images/clock-tower.jpg',
    'assets/images/salad.jpg',
    'assets/images/landscape.png',
  ];

  final List<String> favorites = [];

  void imgRandom() {
    setState(() {
      int index = Random().nextInt(images.length);
      img = images[index];
    });
  }

  void save() {
    if (img.isEmpty) return;
    if (!favorites.contains(img)) {
      setState(() {
        favorites.add(img);
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("บันทึกการ์ดแล้ว")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("การ์ดนี้บันทึกไว้แล้ว")));
    }
  }

  void viewFavorites() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FavoritesPage(favorites: favorites),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          'RandomCard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.orangeAccent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 4,
              child: Column(
                children: [
                  if (img.isNotEmpty)
                    Center(
                      child: Image.asset(
                        img,
                        width: 300,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  SizedBox(height: 20),
                  FilledButton(onPressed: imgRandom, child: Text('Random')),
                  SizedBox(height: 50),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FilledButton(onPressed: save, child: Text('Save')),
                    SizedBox(width: 10),
                    FilledButton(onPressed: viewFavorites, child: Text('View')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  final List<String> favorites;

  const FavoritesPage({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(title: Text("Favorites")),
      body: favorites.isEmpty
          ? Center(child: Text("ยังไม่มีการ์ดที่บันทึก"))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(favorites[index], width: 50),
                  title: Text(favorites[index]),
                );
              },
            ),
    );
  }
}
