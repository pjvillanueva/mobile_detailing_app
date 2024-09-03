// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class GreetingsText extends StatelessWidget {
   GreetingsText({super.key, required this.name});

  String name;
  

  String get greeting {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour >= 5 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$greeting, $name!',
      style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    );
  }
}
