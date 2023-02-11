import 'dart:convert';
import 'package:http/http.dart' as http;
import 'data.dart';

class Service {
  Future<List<cData>> getAllData() async {
    final response = await http.get(
      Uri.parse ('https://63cffbf5e52f587829a96827.mockapi.io/data_genre_musik'),
    );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => cData.fromjson(data)).toList();
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
