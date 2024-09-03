import 'package:flutter/material.dart';

class MonthFilterButton extends StatefulWidget {
  const MonthFilterButton({super.key});

  @override
  State<MonthFilterButton> createState() => _MonthFilterButtonState();
}

class _MonthFilterButtonState extends State<MonthFilterButton> {
  String selectedMonth = 'Jan';
  final List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
        color: Theme.of(context).colorScheme.primary,
        onSelected: (String month) {
          setState(() {
            selectedMonth = month;
          });
        },
        itemBuilder: (BuildContext context) {
          return months.map((String month) {
            return PopupMenuItem<String>(
              value: month,
              child: Text(month,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary)),
            );
          }).toList();
        },
        child: ElevatedButton(
            onPressed: null,
            style: ButtonStyle(
                side: WidgetStateProperty.all(
                    BorderSide(color: Theme.of(context).colorScheme.secondary)),
                backgroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.secondary)),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              const Icon(Icons.calendar_month, color: Colors.white),
              const SizedBox(width: 10.0),
              Text(
                selectedMonth,
                style: const TextStyle(fontSize: 16.0, color: Colors.white),
              )
            ])));
  }
}
