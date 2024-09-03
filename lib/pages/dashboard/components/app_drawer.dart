// ignore_for_file: avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_detailing_app/cubits/theme_cubit.dart';
import 'package:mobile_detailing_app/cubits/user_cubit.dart';
import 'package:mobile_detailing_app/pages/app_web_view.dart';
import 'package:mobile_detailing_app/pages/bookings/bookings_page.dart';
import 'package:mobile_detailing_app/pages/calendar_page.dart';
import 'package:mobile_detailing_app/pages/customers/customers_page.dart';
import 'package:mobile_detailing_app/pages/marketing/marketing_page.dart';
import 'package:mobile_detailing_app/pages/messages/messages_page.dart';
import 'package:mobile_detailing_app/pages/supplies/supplies_page.dart';
import 'package:mobile_detailing_app/services/preference_utils.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    var user = context.read<UserCubit>().state.user;
    return SizedBox(
      width: 280,
      child: Drawer(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
                height: 250,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue.shade800),
                  margin: const EdgeInsets.only(bottom: 8.0),
                  currentAccountPicture:
                      Image.asset('assets/images/n&clogo.png'),
                  currentAccountPictureSize: const Size(90.0, 90.0),
                  accountName: Text(user?.fullName ?? '',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary)),
                  accountEmail: Text(user?.email ?? '',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary)),
                )),
            Column(
              children: [
                ListTile(
                    leading: Icon(Icons.home_outlined,
                        color: Theme.of(context).colorScheme.secondary),
                    title: const Text('Dashboard'),
                    onTap: () => Navigator.of(context).pop()),
                ListTile(
                    leading: Icon(Icons.campaign_outlined,
                        color: Theme.of(context).colorScheme.secondary),
                    title: const Text('Marketing'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MarketingPage()));
                    }),
                ListTile(
                  leading: Icon(Icons.email_outlined,
                      color: Theme.of(context).colorScheme.secondary),
                  title: const Text('Messages'),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MessagesPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.group_outlined,
                      color: Theme.of(context).colorScheme.secondary),
                  title: const Text('Customers'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustomersPage()));
                  },
                ),
                ListTile(
                    leading: Icon(Icons.add_circle_outline,
                        color: Theme.of(context).colorScheme.secondary),
                    title: const Text('Add Booking'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AppWebView(
                                    title: 'Add Booking',
                                    url:
                                        'https://santarosadetailing.com/booking/',
                                  )));
                    }),
                ListTile(
                    leading: Icon(Icons.schedule_outlined,
                        color: Theme.of(context).colorScheme.secondary),
                    title: const Text('Bookings'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BookingsPage()));
                    }),
                ListTile(
                    leading: Icon(Icons.calendar_month_outlined,
                        color: Theme.of(context).colorScheme.secondary),
                    title: const Text('Calendar'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CalendarPage()));
                    }),
                ListTile(
                    leading: Icon(Icons.inventory_2_outlined,
                        color: Theme.of(context).colorScheme.secondary),
                    title: const Text('Supplies'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SuppliesPage()));
                    }),
                const Divider(),
                BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
                  bool isDark = state.themeMode == ThemeMode.dark;
                  return ListTile(
                    leading: Icon(
                        isDark
                            ? Icons.wb_sunny_outlined
                            : Icons.dark_mode_outlined,
                        color: Theme.of(context).colorScheme.secondary),
                    title: Text(isDark ? 'Light Theme' : 'Dark Theme'),
                    onTap: () {
                      BlocProvider.of<ThemeCubit>(context).setTheme(!isDark);
                    },
                  );
                }),
                ListTile(
                    leading: Icon(Icons.logout_outlined,
                        color: Theme.of(context).colorScheme.secondary),
                    title: const Text('Logout'),
                    onTap: () async {
                      try {
                        PreferenceUtils().deleteData('user_id');
                        context.read<UserCubit>().clearUser();
                        await FirebaseAuth.instance.signOut();
                      } catch (e) {
                        print('Error signing out');
                      }
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
