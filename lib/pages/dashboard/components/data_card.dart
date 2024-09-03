import 'package:flutter/material.dart';
import 'package:mobile_detailing_app/widgets/buttons/month_filter_button.dart';

class DataCard extends StatelessWidget {
  const DataCard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).colorScheme.surface,
        child: Container(
            padding: const EdgeInsets.all(20.0),
            height: 400.0,
            child: Column(children: [
              Row(children: [
                Text(title,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
                const Spacer(),
                const MonthFilterButton()
              ])
            ])));
  }
}
