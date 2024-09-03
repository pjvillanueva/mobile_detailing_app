import 'package:flutter/material.dart';
import 'package:mobile_detailing_app/models/client.dart';
import 'package:mobile_detailing_app/pages/customers/customer_card.dart';
import 'package:mobile_detailing_app/pages/customers/customer_search_field.dart';
import 'package:mobile_detailing_app/widgets/utils/constants.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({super.key});

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage>
    with SingleTickerProviderStateMixin {
  String _searchQuery = '';

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
    });
  }

  List<Client> _filterClients(List<Client> clients) {
    if (_searchQuery.isEmpty) {
      return clients;
    }
    return clients
        .where((client) =>
            client.firstName.toLowerCase().contains(_searchQuery) ||
            client.lastname.toLowerCase().contains(_searchQuery) ||
            client.fullName.toLowerCase().contains(_searchQuery) ||
            client.email.toLowerCase().contains(_searchQuery))
        .toList();
  }

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
                      'Customers',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                CustomerSearchField(onChanged: _onSearchChanged),
                const SizedBox(height: 10.0),
                TabBar(
                    controller: _tabController,
                    tabs: [
                      _buildTab('Scheduled', Colors.orange),
                      _buildTab('All', Colors.blue),
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
                    child: TabBarView(controller: _tabController, children: [
                  _buildCustomerList(_filterClients(clients)),
                  _buildCustomerList(_filterClients(clients)),
                ]))
              ],
            ),
          ))),
    );
  }
}

Widget _buildTab(String text, Color color) {
  return Tab(
    child: Container(
      decoration: BoxDecoration(color: color),
      child: Align(alignment: Alignment.center, child: Text(text)),
    ),
  );
}

Widget _buildCustomerList(List<Client> clients) {
  return ListView.builder(
      itemCount: clients.length,
      itemBuilder: (context, index) {
        return CustomerCard(client: clients[index]);
      });
}
