import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomerSearchField extends StatelessWidget {
  CustomerSearchField({super.key, required this.onChanged});

  Function(String query) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        cursorColor: Theme.of(context).colorScheme.secondary,
        decoration: InputDecoration(
          label: Text('Search',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
          suffixIcon: Icon(Icons.search,
              color: Theme.of(context).colorScheme.secondary),
          fillColor: Colors.transparent,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary, width: 2.0),
            borderRadius: const BorderRadius.all(Radius.circular(100.0)),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary, width: 2.0),
              borderRadius: const BorderRadius.all(Radius.circular(100.0))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary, width: 2.0),
              borderRadius: const BorderRadius.all(Radius.circular(100.0))),
        ),
        onChanged: onChanged);
  }
}
