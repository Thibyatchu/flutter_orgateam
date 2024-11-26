class Joueur {
  final String nom;
  final String position;
  final int age;
  final String dateNaissance;
  final int pointure;
  final int essaisMarques;
  final List<Map<String, String>> cartons; // [{"couleur": "jaune", "date": "2024-02-15"}]
  final List<String> postesSecondaires;

  Joueur({
    required this.nom,
    required this.position,
    required this.age,
    required this.dateNaissance,
    required this.pointure,
    required this.essaisMarques,
    required this.cartons,
    required this.postesSecondaires,
  });
}
