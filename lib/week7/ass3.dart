import 'package:flutter/material.dart';

class CoffeeApp2 extends StatefulWidget {
  const CoffeeApp2({super.key});

  @override
  State<CoffeeApp2> createState() => _CoffeeApp2State();
}

class _CoffeeApp2State extends State<CoffeeApp2> {
  bool hot = false;
  double sugar = 2;
  final List<String> sugars = ['none', 'less', 'normal'];
  int? coffeeSelected;
  bool ordered = false;

  final List<Map<String, dynamic>> coffees = [
    {
      'name': 'Latte',
      'price': 35,
      'image':
          'https://i.pinimg.com/1200x/f8/56/d2/f856d2d30045e34f7a3d7438d81c5141.jpg',
    },
    {
      'name': 'Americano',
      'price': 30,
      'image':
          'https://i.pinimg.com/736x/fd/02/63/fd0263d8b4309379bf141d4043b1fb16.jpg',
    },
    {
      'name': 'Cappuccino',
      'price': 40,
      'image':
          'https://i.pinimg.com/736x/f0/65/5f/f0655f2737da76be9b4ac435c65e3d9b.jpg',
    },
  ];

  void switch1(bool value) {
    setState(() {
      hot = value;
    });
  }

  void order(BuildContext context) {
    final coffee = coffees[coffeeSelected!];
    int price = coffee['price'] + (hot ? 5 : 0);
    String sugarText = (sugars[sugar.round()] == 'none')
        ? 'no'
        : '${sugars[sugar.round()]}';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Your order'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                coffee['image'],
                width: 220,
                height: 180,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              Text(
                '${hot ? 'Cold' : 'Hot'} ${coffee['name']} with $sugarText sugar. Price = $price baht',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  ordered = true;
                });
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[800],
        title: const Text(
          'MFU Coffee Shop',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text('Your order', style: TextStyle(fontSize: 26)),
              ),
              const SizedBox(height: 16),

              const Text(
                'Coffee',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ...List.generate(
                coffees.length,
                (index) => RadioListTile<int>(
                  title: Text(
                    '${coffees[index]['name']} ${coffees[index]['price']}',
                  ),
                  activeColor: Colors.deepPurple,
                  value: index,
                  groupValue: coffeeSelected,
                  onChanged: (val) {
                    setState(() {
                      coffeeSelected = val;
                    });
                  },
                ),
              ),
              const SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Type',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Text('Hot'),
                      Switch(value: hot, onChanged: switch1),
                      const Text('Cold (+5)'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),

              Row(
                children: [
                  const Text(
                    'Sugar',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 18),
                  const Text('None'),
                  Expanded(
                    child: Slider(
                      value: sugar,
                      min: 0,
                      max: (sugars.length - 1).toDouble(),
                      divisions: sugars.length - 1,
                      label: sugars[sugar.round()],
                      activeColor: Colors.deepPurple,
                      onChanged: (value) {
                        setState(() {
                          sugar = value;
                        });
                      },
                    ),
                  ),
                  const Text('Normal'),
                ],
              ),
              const SizedBox(height: 20),

              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[800],
                  ),
                  onPressed: () => order(context),
                  child: const Text(
                    'ORDER',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 28),

              if (ordered)
                const Center(
                  child: Text(
                    'Thank you for your order!',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
