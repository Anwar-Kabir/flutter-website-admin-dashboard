
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'http://localhost:8000/api/';

  Future<Map<String, dynamic>?> registerSchool({
    required String name,
    required String address,
    required String phone,
    required String email,
    required String eiin,
    required String password,
    required String imageBase64,
  }) async {
    final url = Uri.parse('${_baseUrl}register');
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'school_name': name,
          'school_address': address,
          'phone': phone,
          'email': email,
          'eiin': eiin,
          'password': password,
          'image': imageBase64,
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to register school: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to register school: $error');
    }
  }
}
