import 'package:flutter/material.dart';
import 'package:flutter_application_1/Project/test2.dart';

class RequestInfoPage extends StatefulWidget {
  const RequestInfoPage({super.key});

  @override
  State<RequestInfoPage> createState() => _RequestInfoPageState();
}

class _RequestInfoPageState extends State<RequestInfoPage> {
  DateTime fromDate = DateTime(2025, 10, 5);
  DateTime toDate = DateTime(2025, 10, 12);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF8B0000),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label: 'My Request'),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Header Row ss
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // REQUEST INFO
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF8B0000),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'REQUEST INFO',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),

                  // STATUS Button (go to next page)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RequestStatusPage()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'STATUS',
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Main Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    // Room Title
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF8B0000),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'เรือนแรมสีแดง',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Image + Date
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/salad.jpg',
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _dateBox(
                                label: 'FROM',
                                date: fromDate,
                                onTap: _pickFrom),
                            const SizedBox(height: 10),
                            _dateBox(label: 'TO', date: toDate, onTap: _pickTo),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _actionButton('CONFIRM', Colors.green),
                        _actionButton('CANCEL', Colors.red),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Action Buttons
  Widget _actionButton(String label, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(label),
    );
  }

  // 🔹 Date Box (Click to pick date)
  Widget _dateBox({
    required String label,
    required DateTime date,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 12)),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 12),
                const SizedBox(width: 4),
                Text(
                  '${date.day}/${date.month}/${date.year}',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Pick Date
  Future<void> _pickFrom() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: fromDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );
    if (newDate != null) {
      setState(() => fromDate = newDate);
    }
  }

  Future<void> _pickTo() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: toDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );
    if (newDate != null) {
      setState(() => toDate = newDate);
    }
  }
}

