import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BookingCardButton extends StatelessWidget {
  BookingCardButton(this.icon, this.color, this.text, this.onPressed,
      {super.key});

  IconData icon;
  Color color;
  String text;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              color: Colors.white,
              style:
                  ButtonStyle(backgroundColor: WidgetStateProperty.all(color)),
              icon: Icon(icon),
              onPressed: onPressed),
          Text(text,
              style: TextStyle(
                  fontSize: 12, color: Theme.of(context).colorScheme.onSurface))
        ]);
  }
}

// ignore: must_be_immutable
class BookingCardButton2 extends StatelessWidget {
  const BookingCardButton2(this.icon, this.color, this.text, this.onPressed,
      {super.key});

  final IconData icon;
  final Color color;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 5),
          ),
          onPressed: onPressed,
          child: Column(children: [
            Icon(icon, color: Colors.white, size: 18),
            Text(text,
                style: const TextStyle(fontSize: 10, color: Colors.white))
          ]),
        ),
      ],
    );
  }
}
