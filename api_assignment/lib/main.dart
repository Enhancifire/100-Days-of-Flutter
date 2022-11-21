import 'package:api_assignment/models/data_provider.dart';
import 'package:api_assignment/models/university_provider.dart';
import 'package:api_assignment/pages/dashboard.dart';
import 'package:api_assignment/pages/login.dart';
import 'package:api_assignment/pages/register.dart';
import 'package:api_assignment/pages/user_data.dart';
import 'package:api_assignment/utils/authentication/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => UniversityNotifier()),
        ),
        ChangeNotifierProvider(
          create: ((context) => UserDataNotifier()),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: '/widget_tree',
          routes: {
            '/login': (context) => const LoginScreen(),
            '/register': (context) => const Register(),
            '/home': (context) => const HomePage(),
            '/widget_tree': (context) => const WidgetTree(),
            '/userdata': (context) => const UserDataInput(),
          }),
    );
  }
}
