import 'dart:convert';

import 'package:flutter_workshop/models/stock.dart';
import 'package:flutter_workshop/networks/userAPI.dart';
import 'package:http/http.dart' as http;

class InventoryAPI {
  UserAPI userAPI = UserAPI();
  String url = 'https://inventory-workshop-2022.herokuapp.com/inventory';

  Future<List<Stock?>?> getAll() async {
    String? TOKEN = await userAPI.getToken();
    print('TOKEN $TOKEN');
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

  Future<Stock?> createStock({required Stock stock}) async {
    String? TOKEN = await userAPI.getToken();
    var urlApi = Uri.parse('$url/');
    final response = await http.post(urlApi,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $TOKEN'
        },
        encoding: Encoding.getByName('utf-8'),
        body: jsonEncode(stock));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return Stock.fromJson(result);
    }
    return null;
  }

  Future<Stock?> updateStock({required Stock stock}) async {
    String? TOKEN = await userAPI.getToken();
    var urlApi = Uri.parse('$url/${stock.id}');
    final response = await http.put(urlApi,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $TOKEN'
        },
        encoding: Encoding.getByName('utf-8'),
        body: jsonEncode(stock));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return Stock.fromJson(result);
    }
    return null;
  }

  Future<String?> deleteStock({required int id}) async {
    String? TOKEN = await userAPI.getToken();
    var urlApi = Uri.parse('$url/$id');
    final response = await http.delete(urlApi, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $TOKEN',
    });
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["detail"];
    } else {
      return null;
    }
  }
}
