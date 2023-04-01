import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard(this.user, {Key? key}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 16.0),
              child: Text(user.username + ",",
                  style: const TextStyle(fontSize: 40, color: Colors.amber)),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  final String username, email, password;
  const User(this.username, this.email, this.password);
}
