// ignore_for_file: use_build_context_synchronously

import 'package:api_assignment/models/data_provider.dart';
import 'package:api_assignment/pages/register.dart';
import 'package:api_assignment/utils/authentication/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Auth _auth = Auth();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;

  void toggle() {
    if (_obscureText) {
      setState(() {
        _obscureText = false;
      });
    } else {
      setState(() {
        _obscureText = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Email'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Password',
                suffixIcon: GestureDetector(
                  onTap: () {
                    toggle();
                  },
                  child: _obscureText
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
              ),
              obscureText: _obscureText,
            ),
          ),
          Consumer<UserDataNotifier>(
            builder: (context, value, child) => ElevatedButton.icon(
              onPressed: () async {
                await _auth.signinWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
                await value.login();
              },
              icon: const Icon(Icons.login),
              label: const Text('Login'),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const Register()),
                ),
              );
            },
            icon: const Icon(Icons.app_registration),
            label: const Text('Register Instead'),
          ),
        ],
      ),
    );
  }
}
