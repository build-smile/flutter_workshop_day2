import 'dart:convert';

import 'package:flutter_workshop/models/login.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserAPI {
  String url = 'https://inventory-workshop-2022.herokuapp.com';

  Future<String> register(
      {required String username, required String password}) async {
    var urlAPi = Uri.parse('$url/user/');
    final response = await http.post(urlAPi,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}));
    print(response.body);
    if (response.statusCode == 200) {
      return 'Register Complete';
    } else if (response.statusCode == 400) {
      return 'User already registered';
    } else {
      return 'Somthing went wrong';
    }
  }

  Future<Login?> login(
      {required String username, required String password}) async {
    var urlAPi = Uri.parse('$url/token');
    final response = await http.post(urlAPi,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        encoding: Encoding.getByName('utf-8'),
        body: {'username': username, 'password': password});
    print(response.body);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Login? login = Login.fromJson(result);
      return login;
    }
    return null;
  }

  storeToken({required String token}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getString('token');
  }
}
