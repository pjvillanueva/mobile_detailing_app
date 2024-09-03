import 'package:flutter/material.dart';
import 'package:mobile_detailing_app/models/booking.dart';
import 'package:mobile_detailing_app/pages/bookings/components/booking_card.dart';
import 'package:mobile_detailing_app/pages/bookings/components/booking_search_field.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({super.key});

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage>
    with SingleTickerProviderStateMixin {
  String _searchQuery = '';

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
    });
  }

  List<Booking> _filterBookings(List<Booking> bookings) {
    if (_searchQuery.isEmpty) {
      return bookings;
    }
    return bookings
        .where((booking) =>
            booking.vehicle.toLowerCase().contains(_searchQuery) ||
            booking.package.toLowerCase().contains(_searchQuery) ||
            booking.services
                .any((service) => service.toLowerCase().contains(_searchQuery)))
        .toList();
  }

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back_ios,
                            size: 24.0,
                            color: Theme.of(context).colorScheme.onSurface)),
                    Text(
                      'Bookings',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                BookingSearchField(onChanged: _onSearchChanged),
                const SizedBox(height: 10.0),
                TabBar(
                    controller: _tabController,
                    tabs: [
                      _buildTab('Completed', Colors.blue),
                      _buildTab('Open', Colors.red),
                      _buildTab('Upcoming', Colors.green),
                    ],
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                    dividerHeight: 0.0,
                    indicatorColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 3.0,
                    indicatorPadding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.zero),
                const SizedBox(height: 10.0),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildBookingList(_filterBookings(sampleBookings
                          .where((booking) =>
                              booking.status == BookingStatus.completed)
                          .toList())),
                      _buildBookingList(_filterBookings(sampleBookings
                          .where(
                              (booking) => booking.status == BookingStatus.open)
                          .toList())),
                      _buildBookingList(_filterBookings(sampleBookings
                          .where((booking) =>
                              booking.status == BookingStatus.upcoming)
                          .toList())),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String text, Color color) {
    return Tab(
      child: Container(
        decoration: BoxDecoration(color: color),
        child: Align(alignment: Alignment.center, child: Text(text)),
      ),
    );
  }

  Widget _buildBookingList(List<Booking> bookings) {
    return ListView.builder(
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        return BookingCard(booking: bookings[index]);
      },
    );
  }
}
