import 'package:flutter/material.dart';
import 'package:flutter_workshop/components/userForm.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        child: UserForm(
          submit: register,
          textButton: 'Register',
        ),
      ),
    );
  }

  register(String username, String password) {}
}
