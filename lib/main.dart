import 'Features/Favourites/Repo/repository_impl_favorite.dart';
import 'Features/Favourites/cubit/favorite_cubit.dart';
import 'Features/Profile/Cubit/profile_cubit.dart';
import 'Features/Profile/Data/Repo/profile_repository_impl.dart';
import 'Features/home/View/Cubit/home_cubit.dart';
import 'Features/home/Data/Repo/repository_impl_home.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Core/Storage/Local/local_storage_keys.dart';
import 'Core/Storage/Local/local_storage_service.dart';
import 'Core/Storage/Remote/api_service.dart';
import 'Core/Services/local_favorites_service.dart';
import 'Core/Services/user_data_service.dart';
import 'Features/Auth/Data/Repo/repository_impl.dart';
import 'Features/Maps/cubit/maps_cubit.dart';

import 'Features/Auth/view/Cubit/auth_in_cubit.dart';
import 'Features/Main/Cubit/main_pages_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Core/Routes/Navigation/navigation_service.dart';
import 'Core/Routes/app_routes.dart';
import 'Core/Routes/route_generator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Core/Resources/colors.dart';

import 'Core/Resources/constant.dart';
import 'package:flutter/material.dart';

final AppNavigationService kNavigationService = AppNavigationService();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await LocalStorageService.init();
  await LocalFavoritesService.init();
  await UserDataService.init();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthCubit(authRepositoryImpl: AuthRepositoryImpl()),
        ),
        BlocProvider(create: (_) => MainPagesCubit()),
        BlocProvider(create: (_) => MapsCubit()),
        BlocProvider(create: (_) => HomeCubit(HomeRepositoryImpl())..init()),
        BlocProvider(
          create:
              (_) => FavoriteCubit(RepositoryImplFavorite())..getfavourites(),
        ),
        BlocProvider(
          create:
              (_) =>
                  ProfileCubit(profileRepository: ProfileRepositoryImpl())
                    ..loadCurrentUser(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
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
            initialRoute: getInitialRoute(),
            navigatorKey: kNavigationService.navigatorKey,
          );
        },
      ),
    );
  }

  String getInitialRoute() {
    final bool isLoggedIn = LocalStorageService.getValue(
      LocalStorageKeys.isLoggedIn,
      defaultValue: false,
    );
    if (isLoggedIn) {
      return AppRoutes.main;
    }
    return AppRoutes.login;
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
