import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supabase_test/supabase_integration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
	Image.network("https://supabase.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fsupabase-logo-wordmark--dark.53d797e9.png&w=256&q=75"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _emailController,
            ),
          ),
          _isLoading
              ? CircularProgressIndicator()
              : ElevatedButton.icon(
                  onPressed: () async {
		  setState(() {
		  		    _isLoading = true;
		  		  });
                    await SupabaseHelper().signUp(_emailController.text);
		  setState(() {
		  		    _isLoading = false;
		  		  });
                  },
                  icon: const FaIcon(FontAwesomeIcons.signIn),
                  label: const Text('Login'),
                ),
        ],
      ),
    );
  }
}
