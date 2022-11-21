import 'package:api_assignment/models/data_provider.dart';
import 'package:api_assignment/models/users.dart';
import 'package:api_assignment/pages/universities.dart';
import 'package:api_assignment/utils/authentication/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<FirebaseUser> user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<UserDataNotifier>(
          builder: (context, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(
                    value.imageURL,
                  ),
                ),
                Text(
                  value.name,
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  value.age,
                  style: const TextStyle(fontSize: 20),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => UniversityPage()),
                      ),
                    );
                  },
                  child: const Text('View Universities'),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    Auth auth = Auth();
                    await auth.signOutFromGoogle();
                    value.logout();
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text("Sign Out"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
