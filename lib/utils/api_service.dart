import 'dart:convert';
import 'package:http/http.dart' as http;
import '../pages/models/joueur_model.dart';
import '../pages/evenement/evenement_model.dart';
import '../pages/equipe/equipe_model.dart';

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<List<Evenement>> fetchEvenements() async {
    final response = await http.get(Uri.parse('$baseUrl/evenements'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Evenement.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load evenements');
    }
  }

  Future<List<Equipe>> fetchEquipes() async {
    final response = await http.get(Uri.parse('$baseUrl/equipes'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Equipe.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load equipes');
    }
  }

  Future<List<Joueur>> fetchJoueurs() async {
    final response = await http.get(Uri.parse('$baseUrl/joueurs'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Joueur.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load joueurs');
    }
  }
}