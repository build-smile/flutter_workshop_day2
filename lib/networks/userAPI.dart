import 'dart:convert';
import 'package:http/http.dart' as http;

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
}
