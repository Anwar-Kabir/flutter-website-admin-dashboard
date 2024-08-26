// import 'package:dashboard/api_service/urls.dart';
// import 'package:dashboard/models/new_school_model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

 

// class ApiService {
//   final String baseUrl =  apiBaseUrl;

//   Future<bool> registerSchool(School school) async {
//     final url = Uri.parse('$baseUrl/register');

//     try {
//       final response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(school.toJson()),
//       );

//       if (response.statusCode == 201) {
//         return true;
//       } else {
//         print('Failed to register school: ${response.statusCode}');
//         print('Response body: ${response.body}');
//         return false;
//       }
//     } catch (e) {
//       print('Error registering school: $e');
//       return false;
//     }
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dashboard/models/new_school_model.dart';
import 'package:dashboard/api_service/urls.dart';

class ApiService {
  final String baseUrl = apiBaseUrl;

  Future<bool> registerSchool(School school) async {
    final url = Uri.parse('$baseUrl/register');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(school.toJson()),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        print('Failed to register school: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error registering school: $e');
      return false;
    }
  }
}

