import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:router_test/screens/home.screen.dart';
import 'package:router_test/screens/login.screen.dart';
import 'package:router_test/screens/profile.screen.dart';

class AppRoutes {
  static GoRouter returnRouter(bool isAuth) {
    GoRouter router = GoRouter(
      routes: [
        GoRoute(
          name: AppRouteConstants.homeRouteName,
          path: '/',
          pageBuilder: (context, state) => const MaterialPage(
            child: HomePage(),
          ),
        ),
        GoRoute(
          name: AppRouteConstants.loginRouteName,
          path: '/login',
          pageBuilder: (context, state) => const MaterialPage(
            child: LoginPage(),
          ),
        ),
        GoRoute(
          name: AppRouteConstants.profileRouteName,
          path: '/profile',
          pageBuilder: (context, state) => const MaterialPage(
            child: ProfilePage(),
          ),
        ),
      ],
    );
    return router;
  }
}

class AppRouteConstants {
  static const String homeRouteName = 'home';
  static const String loginRouteName = 'login';
  static const String profileRouteName = 'profile';
}
