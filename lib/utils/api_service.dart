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

  Future<void> createEquipe(Equipe equipe) async {
    final response = await http.post(
      Uri.parse('$baseUrl/equipes'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(equipe.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create equipe');
    }
  }

  Future<void> updateEquipe(Equipe equipe) async {
    final response = await http.put(
      Uri.parse('$baseUrl/equipes/${equipe.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(equipe.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update equipe');
    }
  }

  Future<void> deleteEquipe(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/equipes/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete equipe');
    }
  }

  Future<void> createJoueur(Joueur joueur) async {
    final response = await http.post(
      Uri.parse('$baseUrl/joueurs'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(joueur.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create joueur');
    }
  }

  Future<void> updateJoueur(Joueur joueur) async {
    final response = await http.put(
      Uri.parse('$baseUrl/joueurs/${joueur.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(joueur.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update joueur');
    }
  }

  Future<void> deleteJoueur(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/joueurs/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete joueur');
    }
  }

  Future<void> createEvenement(Evenement evenement) async {
    final response = await http.post(
      Uri.parse('$baseUrl/evenements'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(evenement.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create evenement');
    }
  }

  Future<void> updateEvenement(Evenement evenement) async {
    final response = await http.put(
      Uri.parse('$baseUrl/evenements/${evenement.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(evenement.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update evenement');
    }
  }

  Future<void> deleteEvenement(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/evenements/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete evenement');
    }
  }
}