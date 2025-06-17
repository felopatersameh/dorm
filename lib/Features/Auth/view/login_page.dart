import '../Components/contauner_background_auth.dart';
import 'Cubit/auth_in_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Components/form_login.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.messageLogin.isNotEmpty) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.messageLogin)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: ListView(
            physics:  RangeMaintainingScrollPhysics(),
            children: [
                 ContaunerBackgroundAuth(),
                 FormLogin(),
            ]),
        );
      },
    );
  }
}
