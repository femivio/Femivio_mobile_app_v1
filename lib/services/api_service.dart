import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../models/food.dart';

class ApiService {
  static const baseUrl = 'http://51.20.65.186:8080/api';

  static Future<http.Response> register(User user) {
    return http.post(
      Uri.parse('$baseUrl/users/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );
  }

  static Future<http.Response> login(String email, String password) {
    return http.post(
      Uri.parse('$baseUrl/users/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
  }

  static Future<List<Food>> getFoodItems() async {
    final response = await http.get(Uri.parse('$baseUrl/food'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Food.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load food items');
    }
  }
}
