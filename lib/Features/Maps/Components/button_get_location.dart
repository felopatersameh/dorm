import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/Resources/colors.dart';
import '../cubit/maps_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonGetLocation extends StatelessWidget {
  const ButtonGetLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16.h,
      right: 16.w,
      child: FloatingActionButton(
        backgroundColor: AppColor.secondColors,
        child: Icon(Icons.my_location, color: AppColor.primaryColors),
        onPressed: () => context.read<MapsCubit>().getlocationData(),
      ),
    );
  }
}
