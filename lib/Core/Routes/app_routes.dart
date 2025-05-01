import '../../Features/Login/login_page.dart';
import '../../Features/Main/main_pages.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String main = '/main';
}

class AppRouteBuilders {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return _defaultPageRoute(const LoginPage());
      case AppRoutes.main:
        return _defaultPageRoute(const MainPages());
      default:
        return _errorRoute('No route defined for "${settings.name}"');
    }
  }

  static MaterialPageRoute<dynamic> _defaultPageRoute(Widget screen) {
    return MaterialPageRoute(builder: (_) => screen);
  }

  // static PageRouteBuilder _secondPageRoute(Widget screen) {
  //   return PageRouteBuilder(
  //     opaque: false,
  //     pageBuilder: (BuildContext context, _, __) => screen,
  //   );
  // }

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
