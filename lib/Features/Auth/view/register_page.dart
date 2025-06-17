import 'Components/contauner_background_auth.dart' ;
import 'Components/form_register.dart';
import 'Cubit/auth_in_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.messageRegister.isNotEmpty) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.messageRegister)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: ListView(
            physics: const RangeMaintainingScrollPhysics(),
           children: [
             ContaunerBackgroundAuth(),
                 FormRegister(),
           ],
          ),
        );
      },
    );
  }
}
