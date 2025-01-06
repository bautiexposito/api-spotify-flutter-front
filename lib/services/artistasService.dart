import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/artistas.dart';

class ApiService {
  final String baseUrl = "http://192.168.0.24:3000/api/artistas";

  Future<List<Artista>> getArtistas() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['data'];

        return jsonData.map((item) => Artista.fromJson(item)).toList();
      } else {
        throw Exception("Error al obtener artistas: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error en la conexión: $e");
    }
  }
}
