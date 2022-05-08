import 'package:flutter/material.dart';
import 'package:flutter_workshop/components/userForm.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(50),
              width: 150,
              height: 150,
              child: FlutterLogo(),
            ),
            UserForm(
              submit: login,
            ),
            TextButton(
              onPressed: () {},
              child: Text('Need an Account'),
            )
          ],
        ),
      ),
    );
  }

  login(String username, String password) {
    print('username: $username password: $password');
  }
}
