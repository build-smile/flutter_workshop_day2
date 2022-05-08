import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  final Function submit;
  const UserForm({Key? key, required this.submit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _keyForm = GlobalKey<FormState>();
    String username = '';
    String password = '';
    return Form(
      key: _keyForm,
      child: Column(
        children: [
          ListTile(
            title: TextFormField(
              onSaved: (String? value) {
                username = value!;
              },
              validator: _validateString,
              decoration: InputDecoration(
                hintText: 'username',
                labelText: 'username',
              ),
            ),
          ),
          ListTile(
            title: TextFormField(
              onSaved: (String? value) {
                password = value!;
              },
              obscureText: true,
              validator: _validateString,
              decoration: InputDecoration(
                hintText: 'password',
                labelText: 'password',
              ),
            ),
          ),
          ListTile(
            title: ElevatedButton(
              onPressed: () {
                if (_keyForm.currentState!.validate()) {
                  _keyForm.currentState!.save();
                  submit(username, password);
                }
              },
              child: Text('Login'),
            ),
          )
        ],
      ),
    );
  }

  String? _validateString(String? value) {
    if (value == null || value == '') {
      return 'Please fill data';
    }
    return null;
  }
}
