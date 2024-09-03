import 'dart:math';
import 'package:flutter/material.dart';

// Generate a random pastel color
Color getRandomPastelColor() {
  final random = Random();
  final r = 200 + random.nextInt(56); // 200-255
  final g = 200 + random.nextInt(56); // 200-255
  final b = 200 + random.nextInt(56); // 200-255
  return Color.fromRGBO(r, g, b, 1);
}
