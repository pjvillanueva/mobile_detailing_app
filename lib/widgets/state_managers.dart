import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_detailing_app/cubits/theme_cubit.dart';
import 'package:mobile_detailing_app/cubits/user_cubit.dart';

class StateManagers extends StatelessWidget {
  const StateManagers({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [

      BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
      BlocProvider<UserCubit>( create: (context) => UserCubit()),
    ], child: child);
  }
}
