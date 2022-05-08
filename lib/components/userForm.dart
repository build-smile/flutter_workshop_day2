import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  final Function submit;
  const UserForm({Key? key, required this.submit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          ListTile(
            title: TextFormField(
              decoration: InputDecoration(
                hintText: 'username',
                labelText: 'username',
              ),
            ),
          ),
          ListTile(
            title: TextFormField(
              decoration: InputDecoration(
                hintText: 'password',
                labelText: 'password',
              ),
            ),
          ),
          ListTile(
            title: ElevatedButton(
              onPressed: () {},
              child: Text('Login'),
            ),
          )
        ],
      ),
    );
  }
}
