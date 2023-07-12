import 'package:http/http.dart' as http;

class HttpClient {
  static const String baseUrl = 'https://64acee629edb4181202ff76f.mockapi.io';
  static const int timeoutDuration = 10; // Durasi timeout dalam detik

  final http.Client _client;
  final bool _requireToken;

  HttpClient({http.Client? client, bool requireToken = true})
      : _client = client ?? http.Client(),
        _requireToken = requireToken;

  Future<http.Response> get(String path, {Map<String, String>? headers}) async {
    final url = Uri.parse('$baseUrl/$path');
    final updatedHeaders = _updateHeaders(headers);

    final response = await _client.get(url, headers: updatedHeaders).timeout(const Duration(seconds: timeoutDuration));

    _handleTokenExpired(response);

    return response;
  }

  Future<http.Response> post(String path, {Map<String, String>? headers, dynamic body}) async {
    final url = Uri.parse('$baseUrl/$path');
    final updatedHeaders = _updateHeaders(headers);

    final response = await _client.post(url, headers: updatedHeaders, body: body).timeout(const Duration(seconds: timeoutDuration));

    _handleTokenExpired(response);

    return response;
  }

  Map<String, String> _updateHeaders(Map<String, String>? headers) {
    final updatedHeaders = headers ?? {};
    
    if (_requireToken) {
      // Tambahkan logika untuk meng-update header jika diperlukan (contoh: tambahkan token)
      // updatedHeaders['Authorization'] = 'Bearer <token>';
    }

    return updatedHeaders;
  }

  void _handleTokenExpired(http.Response response) {
    // Tambahkan logika untuk menangani token kedaluwarsa atau kode status tertentu
    // if (response.statusCode == 401) {
    //   // Lakukan sesuatu ketika token kedaluwarsa atau tidak valid
    // }
  }

  void dispose() {
    _client.close();
  }
}
