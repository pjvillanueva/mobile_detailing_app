import 'package:flutter/material.dart';

class SupplyTypeFilter extends StatefulWidget {
  const SupplyTypeFilter({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  final String selectedFilter;
  final Function(String) onFilterChanged;

  @override
  State<SupplyTypeFilter> createState() => _SupplyTypeFilterState();
}

class _SupplyTypeFilterState extends State<SupplyTypeFilter> {
  final List<String> supplyTypes = [
    'All',
    'Chemicals',
    'Towels',
    'Equipments',
    'Apparel',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).colorScheme.secondary, width: 2.0)),
      child: PopupMenuButton<String>(
        onSelected: (String type) {
          widget.onFilterChanged(type);
        },
        itemBuilder: (BuildContext context) {
          return supplyTypes.map((String type) {
            return PopupMenuItem<String>(value: type, child: Text(type, style: TextStyle(color: Theme.of(context).colorScheme.onSecondary)));
          }).toList();
        },
        child: Row(
          children: [
            Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border: Border(
                  right: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 2.0),
                )),
                child:  Icon(Icons.tune, size: 24, color: Theme.of(context).colorScheme.secondary)),
            SizedBox(
              width: 120,
              height: 40,
              child: Center(
                child: Text(
                  widget.selectedFilter,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
