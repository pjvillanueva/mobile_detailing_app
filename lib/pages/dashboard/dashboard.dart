// ignore_for_file: avoid_print, use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_detailing_app/cubits/user_cubit.dart';
import 'package:mobile_detailing_app/pages/dashboard/components/app_drawer.dart';
import 'package:mobile_detailing_app/pages/dashboard/components/data_card.dart';
import 'package:mobile_detailing_app/pages/dashboard/components/greetings_text.dart';
import 'package:mobile_detailing_app/pages/dashboard/components/map_widget.dart';
import 'package:mobile_detailing_app/pages/dashboard/components/weather_widget.dart';
import 'package:mobile_detailing_app/services/preference_utils.dart';
import 'package:mobile_detailing_app/services/user_service.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    verifyUser();
    super.initState();
  }

  verifyUser() async {
    try {
      await getUser(context);
      var user = context.read<UserCubit>().state.user;
      if (user == null) {
        PreferenceUtils().deleteData('user_id');
        await FirebaseAuth.instance.signOut();
      }
    } catch (e) {
      print(e);
      PreferenceUtils().deleteData('user_id');
      await FirebaseAuth.instance.signOut();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.primary,
      endDrawer: const AppDrawer(),
      body: SafeArea(
          child: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
        return SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: [
                GreetingsText(name: state.user?.firstWordOfFirstName ?? ''),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      if (_scaffoldKey.currentState?.isDrawerOpen == false) {
                        _scaffoldKey.currentState?.openEndDrawer();
                      } else {
                        _scaffoldKey.currentState?.closeEndDrawer();
                      }
                    },
                    icon: const Icon(Icons.menu))
              ]),
              const SizedBox(height: 10.0),
              const WeatherWidget(),
              const SizedBox(height: 10.0),
              const Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Text('TODAY', style: TextStyle(fontSize: 16.0))]),
              const Divider(thickness: 1.0),
              const SizedBox(height: 10.0),
              MapWidget(bookings: const []),
              const SizedBox(height: 10.0),
              const DataCard(title: 'Bookings'),
              const DataCard(title: 'Calls'),
              const DataCard(title: 'Website Activity'),
            ],
          ),
        ));
      })),
    );
  }
}
