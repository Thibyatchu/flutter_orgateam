import '../models/joueur_model.dart';

class Equipe {
  final String title;
  final String description;
  final List<Joueur> joueurs;

  Equipe({required this.title, required this.description, required this.joueurs});

  factory Equipe.fromJson(Map<String, dynamic> json) {
    var list = json['joueurs'] as List;
    List<Joueur> joueursList = list.map((i) => Joueur.fromJson(i)).toList();

    return Equipe(
      title: json['title'],
      description: json['description'],
      joueurs: joueursList,
    );
  }
}