import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../models/food.dart';

class ApiService {
  // Update with your backend base URL
  static const baseUrl = 'http://13.48.190.144:8080/api';

  // Register user
  static Future<http.Response> register(User user) {
    return http.post(
      Uri.parse('$baseUrl/users/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );
  }

  // Login user
  static Future<http.Response> login(String email, String password) {
    return http.post(
      Uri.parse('$baseUrl/users/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
  }

  // Fetch food list
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
