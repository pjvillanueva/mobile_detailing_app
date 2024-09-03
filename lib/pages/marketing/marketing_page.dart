import 'package:flutter/material.dart';
import 'package:mobile_detailing_app/pages/dashboard/components/data_card.dart';

class MarketingPage extends StatelessWidget {
  const MarketingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.arrow_back_ios,
                              size: 24.0,
                              color: Theme.of(context).colorScheme.onSurface)),
                      const Text('Marketing Center',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold))
                    ]),
                    const SizedBox(height: 20.0),
                    const SizedBox(
                      height: 150.0,
                      width: 500.0,
                      child: Row(
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MarketingCard(
                                    icon: Icons.schedule_outlined,
                                    title: 'Bookings',
                                    data: '462'),
                                SizedBox(height: 20),
                                MarketingCard(
                                    icon: Icons.mark_email_read_outlined,
                                    title: 'Subscribers',
                                    data: '203'),
                              ]),
                          SizedBox(width: 50),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                MarketingCard(
                                    icon: Icons.group_outlined,
                                    title: 'Customers',
                                    data: '1'),
                                SizedBox(height: 20),
                                MarketingCard(
                                    icon: Icons.unsubscribe_outlined,
                                    title: 'Unsubscribed',
                                    data: '0'),
                              ]),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const DataCard(title: 'Website Visit'),
                    const DataCard(title: 'Inbound Calls'),
                    const DataCard(title: 'Website Leads'),
                  ],
                ),
              ))),
    );
  }
}

class MarketingCard extends StatelessWidget {
  const MarketingCard(
      {super.key, required this.icon, required this.title, required this.data});

  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Icon(icon, color: Theme.of(context).colorScheme.secondary),
            const SizedBox(width: 10.0),
            Text(title, style: const TextStyle(fontSize: 18.0))
          ]),
          const SizedBox(height: 10.0),
          Text(data, style: const TextStyle(fontSize: 16.0))
        ],
      ),
    );
  }
}
