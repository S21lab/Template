import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ApiClient {
    late final String _baseUrl;
    String? _token;

    ApiClient() {
        _baseUrl = dotenv.env['API_BASE_URL'] ?? 'http://localhost:8080/api/v1';
    }

    void setToken(String token) => _token = token;
    void clearToken() => _token = null;

    Map<String, String> get _headers => {
        'Content-Type': 'application/json',
        if (_token != null) 'Authorization': 'Bearer $_token',
    };

    Future<Map<String, dynamic>> post(String path, Map<String, dynamic> body) async {
        final uri = Uri.parse('$_baseUrl$path');
        final response = await http.post(
            uri,
            headers: _headers,
            body: jsonEncode(body),
        );
        _assertSuccess(response);
        return jsonDecode(response.body) as Map<String, dynamic>;
    }

    Future<Map<String, dynamic>> get(String path) async {
        final uri = Uri.parse('$_baseUrl$path');
        final response = await http.get(uri, headers: _headers);
        _assertSuccess(response);
        return jsonDecode(response.body) as Map<String, dynamic>;
    }

    void _assertSuccess(http.Response response) {
        if (response.statusCode < 200 || response.statusCode >= 300) {
            throw ApiException(response.statusCode, response.body);
        }
    }
}

class ApiException implements Exception {
    final int statusCode;
    final String message;

    const ApiException(this.statusCode, this.message);

    @override
    String toString() => 'ApiException($statusCode): $message';
}
