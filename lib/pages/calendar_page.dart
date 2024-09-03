// ignore_for_file: library_private_types_in_public_api

import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  String _currentView = 'Month';

  Widget _getCalendarView() {
    switch (_currentView) {
      case 'Month':
        return MonthView(
          startDay: WeekDays.sunday,
          useAvailableVerticalSpace: true,
          headerStyle: HeaderStyle(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.secondary),
            headerTextStyle:
                const TextStyle(color: Colors.white),
            leftIcon: const Icon(Icons.chevron_left,
                color: Colors.white),
            rightIcon: const Icon(Icons.chevron_right,
                color: Colors.white),
          ),
        );
      case 'Week':
        return WeekView(
          backgroundColor: Colors.transparent,
          headerStyle: HeaderStyle(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.secondary),
            headerTextStyle:
                const TextStyle(color: Colors.white),
            leftIcon: const Icon(Icons.chevron_left,
                color: Colors.white),
            rightIcon: const Icon(Icons.chevron_right,
                color: Colors.white),
          ),
          halfHourIndicatorSettings: HourIndicatorSettings(
            color: Theme.of(context).colorScheme.secondary,
          ),
        );
      case 'Day':
        return DayView(
          backgroundColor: Colors.transparent,
          headerStyle: HeaderStyle(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.secondary),
            headerTextStyle:
                const TextStyle(color: Colors.white),
            leftIcon: const Icon(Icons.chevron_left,
                color: Colors.white),
            rightIcon: const Icon(Icons.chevron_right,
                color: Colors.white),
          ),
        );
      default:
        return MonthView(
          startDay: WeekDays.sunday,
          useAvailableVerticalSpace: true,
          headerStyle: HeaderStyle(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.secondary),
            headerTextStyle:
                const TextStyle(color: Colors.white),
            leftIcon: const Icon(Icons.chevron_left,
                color: Colors.white),
            rightIcon: const Icon(Icons.chevron_right,
                color: Colors.white),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: CalendarControllerProvider(
        controller: EventController(),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back_ios, size: 24.0),
                        ),
                        const Text(
                          'Calendar',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    DropdownButton<String>(
                      value: _currentView,
                      items: <String>['Month', 'Week', 'Day']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _currentView = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _getCalendarView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
