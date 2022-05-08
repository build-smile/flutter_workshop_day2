import 'dart:convert';

import 'package:flutter_workshop/models/stock.dart';
import 'package:http/http.dart' as http;

import '../config.dart';

class InventoryAPI {
  String url = 'https://inventory-workshop-2022.herokuapp.com/inventory';
  Future<List<Stock?>?> getAll() async {
    //String? TOKEN = await userAPI.getToken();
    print(TOKEN);
    var urlApi = Uri.parse('$url/');
    final response = await http.get(
      urlApi,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $TOKEN'
      },
    );
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      List<Stock> data = result.map((e) => Stock.fromJson(e)).toList();
      return data;
    }
    return null;
  }
}
