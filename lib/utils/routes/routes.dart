import 'package:flutter/material.dart';

import 'package:movies_app/utils/routes/routes_name.dart';
import 'package:movies_app/views/auth/login_screen.dart';
import 'package:movies_app/views/auth/register_screen.dart';
import 'package:movies_app/views/home/home_screen.dart';
import 'package:movies_app/views/onboard/onboard_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.onboard:
        return MaterialPageRoute(builder: (BuildContext context) => const OnboardScreen());

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());

      case RoutesName.register:
        return MaterialPageRoute(builder: (BuildContext context) => const RegisterScreen());

      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text('No route defined')),
          );
        });
    }
  }
}
