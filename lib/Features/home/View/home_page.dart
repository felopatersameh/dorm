import 'package:dorm/Features/home/View/Cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Components/body_page_home.dart';

import '../../../Core/Resources/constant.dart';
import 'Components/cover_image_home_page.dart';
import 'package:flutter/Material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              alignment: AlignmentDirectional(0, -1),
              children: [
                CoverImageHomePage(),
                AppConstant.coverColor,
                BodyPageHome(),
              ],
            ),
          ),
        );
      },
    );
  }
}
