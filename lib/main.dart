import 'package:dorm/Features/Login/Cubit/log_in_cubit.dart';
import 'package:dorm/Features/Main/Cubit/main_pages_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Core/Routes/Navigation/navigation_service.dart';
import 'Core/Routes/app_routes.dart';
import 'Core/Routes/route_generator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Core/Resources/colors.dart';

import 'Core/Resources/constant.dart';
import 'package:flutter/material.dart';

final AppNavigationService kNavigationService = AppNavigationService();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
            BlocProvider(create: (_) => LogInCubit()),
            BlocProvider(create: (_) => MainPagesCubit()),
          ],
      child: ScreenUtilInit(
        designSize: const Size(
          AppConstant.designWidth,
          AppConstant.designHeight,
        ),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        enableScaleWH: () => false,
        enableScaleText: () => true,
        builder: (_, child) {
          ScreenUtil.init(context);

          return MaterialApp(
            title: AppConstant.nameApp,
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            theme: lightThemes(),
            onGenerateRoute: RouteGenerator.generateRoute,
            initialRoute: AppRoutes.login,
            navigatorKey: kNavigationService.navigatorKey,
          );
        },
      ),
    );
  }

  ThemeData lightThemes() => ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.secondColors,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    scaffoldBackgroundColor: AppColor.secondColors,
    brightness: Brightness.light,
  );
}
