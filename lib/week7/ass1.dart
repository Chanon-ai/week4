import 'package:flutter/material.dart';

class DateDemo extends StatefulWidget {
  const DateDemo({super.key});

  @override
  State<DateDemo> createState() => _DateDemoState();
}

class _DateDemoState extends State<DateDemo> {
  String from = '';
  String to = '';
  DateTime? fromDate;

  void selectDate() async {
    DateTime? dt = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year, 1, 1),
      lastDate: DateTime(DateTime.now().year, 12, 31),
    );

    if (dt != null) {
      setState(() {
        fromDate = dt;
        from = '${dt.day}/${dt.month}/${dt.year}';
        
      });
    }
  }

  void selectDate2() async {
    DateTime? dt = await showDatePicker(
      context: context,
      initialDate: fromDate!,
      firstDate: fromDate!,
      lastDate: DateTime(DateTime.now().year, 12, 31),
    );

    if (dt != null) {
      setState(() {
        if (dt.isBefore(fromDate!)) {
          to = from;
        } else {
          to = '${dt.day}/${dt.month}/${dt.year}';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DatePicker Demo')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                FilledButton.icon(
                  onPressed: selectDate,
                  icon: const Icon(Icons.calendar_today),
                  label: const Text('From'),
                ),
                const SizedBox(width: 16),
                Text(from),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                FilledButton.icon(
                  onPressed: selectDate2,
                  icon: const Icon(Icons.calendar_today),
                  label: const Text('To'),
                ),
                const SizedBox(width: 16),
                Text(to),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
