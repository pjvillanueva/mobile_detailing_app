import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mobile_detailing_app/cubits/theme_cubit.dart';
import 'package:mobile_detailing_app/firebase_options.dart';
import 'package:mobile_detailing_app/pages/authentication/login_page.dart';
import 'package:mobile_detailing_app/pages/dashboard/dashboard.dart';
import 'package:mobile_detailing_app/services/preference_utils.dart';
import 'package:mobile_detailing_app/services/weather_service.dart';
import 'package:mobile_detailing_app/widgets/state_managers.dart';
import 'package:path_provider/path_provider.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    WeatherService().init();
    PreferenceUtils().init();
  } catch (e) {
    print("[ERROR] - $e");
  }

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory());

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const StateManagers(child: MobileDetailingApp());
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Dashboard();
        }
        return const LoginPage();
      },
    );
  }
}

class MobileDetailingApp extends StatelessWidget {
  const MobileDetailingApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeMode =
        context.select((ThemeCubit themeCubit) => themeCubit.state.themeMode);

    return MaterialApp(
        home: const AuthWrapper(),
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeMode);
  }
}
