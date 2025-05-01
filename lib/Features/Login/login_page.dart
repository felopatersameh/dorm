import 'Cubit/log_in_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Components/contauner_background_auth.dart';
import 'Components/form_login.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogInCubit, LogInState>(
      builder: (context, state) {
        return Scaffold(
          body: ListView(
            shrinkWrap: true,
            physics: RangeMaintainingScrollPhysics(),
            children: [ContaunerBackgroundAuth(), FormLogin()],
          ),
        );
      },
    );
  }
}
