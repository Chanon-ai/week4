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
  DateTime? toDate;

  void selectDate() async {
    DateTime now = DateTime.now();
    DateTime? dt = await showDatePicker(
      context: context,
      initialDate: fromDate ?? now,
      firstDate: DateTime(now.year, 1, 1),
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
    DateTime? dt = await showDatePicker(
      context: context,
      initialDate: toDate ?? fromDate!,
      firstDate: fromDate!,
      lastDate: DateTime(DateTime.now().year, 12, 31),
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
      appBar: AppBar(title: const Text('DatePicker Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
