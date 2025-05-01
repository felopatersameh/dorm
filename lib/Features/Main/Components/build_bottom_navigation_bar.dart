import 'package:dorm/Core/Resources/colors.dart';
import 'package:dorm/Core/Resources/icons.dart';
import 'package:dorm/Core/Resources/strings.dart';
import 'package:dorm/Features/Main/Cubit/main_pages_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildBottomNavigationBar extends StatelessWidget {
  const BuildBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: AppIcons.home,
          label: AppStrings.home,
        ),
     BottomNavigationBarItem(
          icon: AppIcons.favorite,
          label: AppStrings.favorite,
        ),
        BottomNavigationBarItem(
          icon: AppIcons.maps,
          label: AppStrings.maps,
        ),
       
        BottomNavigationBarItem(
          icon: AppIcons.profile,
          label: AppStrings.profile,
        ),
      ],
      backgroundColor: AppColor.secondColors,
      selectedItemColor: AppColor.selectedItemNavBar,
      type: BottomNavigationBarType.fixed,
      enableFeedback: true,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      currentIndex: context.watch<MainPagesCubit>().state.index,
      onTap: (value) => context.read<MainPagesCubit>().changeIndex(value),
    );
  }
}
