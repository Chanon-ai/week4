import 'package:flutter/material.dart';

class RequestStatusPage extends StatefulWidget {
  const RequestStatusPage({super.key});

  @override
  State<RequestStatusPage> createState() => _RequestStatusPageState();
}

class _RequestStatusPageState extends State<RequestStatusPage> {
  int selectedIndex = 0;

  DateTime? fromDate = DateTime.now();
  DateTime? toDate = DateTime.now();

  String from = '';
  String to = '';

  void selectDate() async {
    DateTime now = DateTime.now();
    DateTime? dt = await showDatePicker(
      context: context,
      initialDate: fromDate ?? now,
      firstDate: DateTime(now.year, now.month, now.day), // ⛔ ห้ามก่อนวันนี้
      lastDate: DateTime(now.year, 12, 31),
    );

    if (dt != null) {
      setState(() {
        fromDate = dt;
        from = '${dt.day}/${dt.month}/${dt.year}';
        if (toDate == null) {
          toDate = dt;
          to = from;
        } else {
          if (dt.isAfter(toDate!)) {
            toDate = dt;
            to = from;
          }
        }
      });
    }
  }

  void selectDate2() async {
    if (fromDate == null) return;
    DateTime now = DateTime.now();
    DateTime? dt = await showDatePicker(
      context: context,
      initialDate: toDate ?? fromDate!,
      firstDate: fromDate!.isBefore(now)
          ? DateTime(now.year, now.month, now.day)
          : fromDate!, // ⛔ ห้ามก่อนวันนี้ + ต้องไม่ก่อน fromDate
      lastDate: DateTime(now.year, 12, 31),
    );

    if (dt != null) {
      setState(() {
        toDate = dt;
        to = '${dt.day}/${dt.month}/${dt.year}';
      });
    }
  }

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
            icon: Icon(Icons.assignment),
            label: 'My Request',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // ปุ่มสลับด้านบน
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _topButton("REQUEST INFO", 0),
                  _topButton("STATUS", 1),
                ],
              ),
              const SizedBox(height: 30),

              // เนื้อหาแต่ละหน้า
              Expanded(
                child: IndexedStack(
                  index: selectedIndex,
                  children: [_buildRequestInfo(), _buildStatus()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topButton(String title, int index) {
    final bool isActive = selectedIndex == index;

    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF8B0000) : Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            if (isActive)
              BoxShadow(
                color: Colors.red.withOpacity(0.4),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
          ],
          border: Border.all(
            color: isActive ? const Color(0xFF8B0000) : Colors.black,
            width: 1.5,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  // 🔹 หน้า REQUEST INFO
  Widget _buildRequestInfo() {
    return Center(
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _redTitle('PAPAYA SALAD'),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/salad.jpg',
                    width: 110,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    const Text(
                      'FROM',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    _dateBox(date: fromDate, onTap: selectDate),
                    const SizedBox(height: 10),
                    const Text(
                      'TO',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    _dateBox(date: toDate, onTap: selectDate2),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            // 🔹 เรียกใช้แบบนี้
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _actionButton('CONFIRM', Colors.green, textColor: Colors.white),
                _actionButton('CANCEL', Colors.red, textColor: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 หน้า STATUS
  Widget _buildStatus() {
    return Center(
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _redTitle('เรือนแรมสีแดง'),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/salad.jpg',
                    width: 110,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    _dateBox(date: fromDate, onTap: selectDate),
                    const SizedBox(height: 10),
                    _dateBox(date: toDate, onTap: selectDate2),
                    const SizedBox(height: 10),
                    _statusBox('PENDING'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              '** Pending staff approval',
              style: TextStyle(color: Colors.red, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Date box (กดเลือกวันได้)
  Widget _dateBox({required DateTime? date, required VoidCallback onTap}) {
    final d = date ?? DateTime.now();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_today, size: 12),
            const SizedBox(width: 4),
            Text(
              '${d.day}/${d.month}/${d.year}',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _redTitle(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF8B0000),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // 🔹 ฟังก์ชันปุ่ม
  Widget _actionButton(
    String label,
    Color color, {
    Color textColor = Colors.white,
  }) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: textColor, // สีตัวอักษร
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.black26), // เพิ่มขอบเบา ๆ ถ้าต้องการ
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _statusBox(String text) {
    return Container(
      width: 130,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.yellow[100],
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'STATUS',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.orange,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
