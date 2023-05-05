import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:router_test/utils/routes.utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              GoRouter.of(context).pushNamed(AppRouteConstants.loginRouteName);
            },
            child: const Text("Login Page"),
          ),
          TextButton(
            onPressed: () {
              GoRouter.of(context)
                  .pushNamed(AppRouteConstants.profileRouteName);
            },
            child: const Text("Profile Page"),
          ),
          // TextButton(
          //   onPressed: () {},
          //   child: const Text("Login Page"),
          // ),
        ],
      ),
    );
  }
}
