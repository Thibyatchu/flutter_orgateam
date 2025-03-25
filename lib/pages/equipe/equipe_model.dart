import '../models/joueur_model.dart';

class Equipe {
  final int? id;
  final String title;
  final String description;
  final List<Joueur> joueurs;

  Equipe({this.id, required this.title, required this.description, required this.joueurs});

  factory Equipe.fromJson(Map<String, dynamic> json) {
    var list = json['joueurs'] as List;
    List<Joueur> joueursList = list.map((i) => Joueur.fromJson(i)).toList();

    return Equipe(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      joueurs: joueursList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'joueurs': joueurs.map((joueur) => joueur.toJson()).toList(),
    };
  }
}