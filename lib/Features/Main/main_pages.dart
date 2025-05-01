import 'Components/message_internet_connection.dart';

import 'Components/build_bottom_navigation_bar.dart';

import '../../Core/Components/custom_app_bar.dart';

import 'Cubit/main_pages_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPages extends StatelessWidget {
  const MainPages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPagesCubit, MainPagesState>(
      builder: (context, state) {
        return Scaffold(
          appBar:state.index ==0 ? null:
          CustomAppBar(
            title: context.watch<MainPagesCubit>().listScreensName(),
          ),
          body:
              state.internet
                  ? context.watch<MainPagesCubit>().listScreens()
                  : MessageInternetConnection(),
          bottomNavigationBar: BuildBottomNavigationBar(),
        );
      },
    );
  }
}
