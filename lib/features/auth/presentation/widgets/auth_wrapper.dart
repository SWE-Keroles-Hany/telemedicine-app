import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telemedicine/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:telemedicine/features/auth/presentation/cubit/auth_states.dart';
import 'package:telemedicine/core/widgets/loading_screen.dart';
import 'package:telemedicine/features/auth/presentation/screens/login_screen.dart';
import 'package:telemedicine/features/home/presentation/screens/home_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is IsUserLoggedLoading) {
          return LoadingScreen();
        } else if (state is IsUserLoggedSuccess) {
          if (state.isLoggedIn) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        } else if (state is IsUserLoggedError) {
          return LoginScreen();
        } else {
          context.read<AuthCubit>().isUserLogged();
          return LoadingScreen();
        }
      },
    );
  }
}
