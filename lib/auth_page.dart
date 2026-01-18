import 'package:flutter/material.dart';
import 'package:namingapp/main.dart';

import 'package:namingapp/auth_service.dart';

class AuthPage extends StatefulWidget {
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  void initState() {
    super.initState();
    authinit();
  }

  void authinit() async {
    bool check = await AuthService().authenticateLocally();
    if (check) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
        title: Center(child: Text("Auth Page")),
      ),
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: IconButton(
          color: Colors.white,
          onPressed: () async {
            authinit();
          },
          icon: Icon(Icons.fingerprint, size: 70),
        ),
      ),
    );
  }
}
