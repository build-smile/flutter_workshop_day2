import 'package:flutter/material.dart';
import 'package:flutter_workshop/components/userForm.dart';
import 'package:flutter_workshop/models/login.dart';
import 'package:flutter_workshop/networks/userAPI.dart';

import '../config.dart';

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
              textButton: 'Login',
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Need an Account'),
            )
          ],
        ),
      ),
    );
  }

  login(String username, String password) async {
    UserAPI userAPI = UserAPI();
    Login? login = await userAPI.login(username: username, password: password);
    if (login == null) {
      SnackBar snackBar = SnackBar(content: Text('Invalid user'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    //userAPI.storeToken(token: login.accessToken);
    TOKEN = login.accessToken;
    print(TOKEN);
    Navigator.pushNamed(context, '/home');
    SnackBar snackBar = SnackBar(content: Text('Welcome to MyApp'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
