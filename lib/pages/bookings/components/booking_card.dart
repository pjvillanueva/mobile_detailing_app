import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mobile_detailing_app/models/booking.dart';
import 'package:mobile_detailing_app/models/client.dart';
import 'package:mobile_detailing_app/pages/bookings/components/booking_card_button.dart';
import 'package:mobile_detailing_app/widgets/dash_divider.dart';
import 'package:mobile_detailing_app/widgets/utils/constants.dart';

class BookingCard extends StatefulWidget {
  final Booking booking;
  const BookingCard({super.key, required this.booking});

  @override
  State<BookingCard> createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {
  var isCardExpanded = false;
  @override
  Widget build(BuildContext context) {
    var client = findClientById(widget.booking.clientId);

    return GestureDetector(
      onTap: () {
        setState(() {
          isCardExpanded = !isCardExpanded;
        });
      },
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        elevation: 3,
        child: IntrinsicHeight(
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: isCardExpanded
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    children: [
                      Visibility(
                          visible: isCardExpanded,
                          child: const SizedBox(height: 30.0)),
                      Text('#${widget.booking.id}',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20.0),
                      Text(
                        Jiffy.parse(widget.booking.date.toString())
                            .format(pattern: 'EEE'),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        Jiffy.parse(widget.booking.date.toString())
                            .format(pattern: 'MMM dd'),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        Jiffy.parse(widget.booking.date.toString())
                            .format(pattern: 'hh:mm a'),
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      Visibility(
                          visible: isCardExpanded,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(height: 30.0),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.call_outlined,
                                      size: 28,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary)),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.mail_outlined,
                                      size: 28,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary)),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.location_on_outlined,
                                      size: 28,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary)),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              const VerticalDashedDivider(color: Colors.grey),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.booking.vehicle,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '\$${widget.booking.price.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      Text(widget.booking.package,
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.onSecondary)),
                      Visibility(
                        visible: isCardExpanded,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BookingCardButton2(Icons.play_arrow,
                                    Colors.green, 'Start', () {}),
                                BookingCardButton2(Icons.check, Colors.blue,
                                    'Complete', () {}),
                                BookingCardButton2(
                                    Icons.edit, Colors.blueGrey, 'Edit', () {}),
                                BookingCardButton2(
                                    Icons.close, Colors.red, 'Cancel', () {}),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                          visible: isCardExpanded,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BookingCardButton2(Icons.description,
                                      Colors.pink, 'Notes', () {}),
                                  BookingCardButton2(Icons.directions_car,
                                      Colors.orange, 'Services', () {}),
                                  BookingCardButton2(Icons.calendar_month,
                                      Colors.purple, 'Schedule', () {})
                                ],
                              )
                            ],
                          )),
                      const Divider(color: Colors.grey, thickness: 1.0),
                      Text(
                        '${client.firstName} ${client.lastname}',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(client.phoneNumber,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontSize: 14.0)),
                      Text(client.completeAddress,
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 13.0)),
                      const Text('Not Assigned',
                          style: TextStyle(color: Colors.red, fontSize: 12.0)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Client findClientById(String id) {
  try {
    return clients.firstWhere((client) => client.id == id);
  } catch (e) {
    return defaultClient;
  }
}
