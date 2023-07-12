import 'dart:convert';

import 'package:bloc_template/services/http_client.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final HttpClient httpClient;

  AuthService({http.Client? client}) : httpClient = HttpClient(client: client);

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await httpClient
        .post('/login', body: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return responseData;
    } else {
      throw Exception('Failed to login');
    }
  }

  // Add other API methods here

  void dispose() {
    httpClient.dispose();
  }
}
