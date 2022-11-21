import 'package:api_assignment/pages/login.dart';
import 'package:api_assignment/pages/user_data.dart';
import 'package:flutter/material.dart';
import 'package:api_assignment/utils/authentication/auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Password',
                suffixIcon: GestureDetector(
                  onTap: () {
                    toggle();
                  },
                  child: _obscureText
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                ),
              ),
              obscureText: _obscureText,
            ),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              Navigator.pushNamed(context, '/userdata', arguments: {
                'email': _emailController.text,
                'password': _passwordController.text,
	      });
            },
            icon: const Icon(Icons.login),
            label: const Text('Register'),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.app_registration),
            label: const Text('Login Instead'),
          ),
        ],
      ),
    );
  }
}
