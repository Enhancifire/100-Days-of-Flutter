import 'package:flutter/material.dart';
import 'package:router_test/utils/routes.utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Router Test',
      theme: ThemeData.dark().copyWith(),
      routeInformationParser:
          AppRoutes.returnRouter(false).routeInformationParser,
      routerDelegate: AppRoutes.returnRouter(false).routerDelegate,
    );
  }
}
