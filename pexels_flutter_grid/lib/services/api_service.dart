import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constants.dart';

class ApiService {
  Future<List<String>> fetchImages() async {
    final response = await http.get(
      Uri.parse('${AppConstants.baseUrl}/curated?per_page=25'),
      headers: {'Authorization': AppConstants.apiKey},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['photos'];
      return data
          .map((photo) => photo['src']['medium'])
          .cast<String>()
          .toList();
    } else {
      throw Exception('Failed to load images');
    }
  }
}
