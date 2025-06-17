import 'package:dorm/Features/Auth/view/register_page.dart';

import '../../Features/Search/search_page.dart';

import '../../Features/Info/info_page.dart' as info;
import '../../Features/Auth/view/login_page.dart';
import '../../Features/Main/main_pages.dart';
import 'package:flutter/material.dart';

import '../../Features/home/Data/Model/dorms_model.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String main = '/main';
  static const String infoPage = '/InfoPage';
  static const String searchPage = '/SearchPage';
}

class AppRouteBuilders {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return _defaultPageRoute(const LoginPage());
      case AppRoutes.register:
        return _defaultPageRoute(const RegisterPage());
      case AppRoutes.main:
        return _defaultPageRoute(const MainPages());
      case AppRoutes.infoPage:
      final dorm = settings.arguments as DormsModel;
        return _defaultPageRoute(info.InfoPage(dorm: dorm,));
      case AppRoutes.searchPage:
        return _defaultPageRoute(const SearchPage());
      default:
        return _errorRoute('No route defined for "${settings.name}"');
    }
  }

  static MaterialPageRoute<dynamic> _defaultPageRoute(Widget screen) {
    return MaterialPageRoute(builder: (_) => screen);
  }

  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            body: Center(
              child: Text(message, style: const TextStyle(fontSize: 18)),
            ),
          ),
    );
  }
}
