import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category.dart';

class ApiService {
  final String baseUrl =
      'https://panaderiaapi-fvarc8eucna2hraj.canadacentral-01.azurewebsites.net';

  Future<List<Category>> fetchCategories() async {
    final url = Uri.parse('$baseUrl/Categoria/Listar');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Procesar la respuesta como una lista de categorías
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Category.fromJson(json)).toList();
      } else {
        throw Exception(
            'Error al conectar con la API: Código ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al conectar con la API: $e');
    }
  }
}