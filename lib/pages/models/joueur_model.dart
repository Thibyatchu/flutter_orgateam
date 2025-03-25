class Joueur {
  final int? id;
  final String nom;
  final String position;
  final int age;
  final String dateNaissance;
  final int pointure;
  final int essaisMarques;
  final List<Map<String, String>> cartons;
  final List<String> postesSecondaires;

  Joueur({
    this.id,
    required this.nom,
    required this.position,
    required this.age,
    required this.dateNaissance,
    required this.pointure,
    required this.essaisMarques,
    required this.cartons,
    required this.postesSecondaires,
  });

  factory Joueur.fromJson(Map<String, dynamic> json) {
    var cartonsFromJson = json['cartons'] as List;
    List<Map<String, String>> cartonsList = cartonsFromJson.map((i) => Map<String, String>.from(i)).toList();

    var postesFromJson = json['postesSecondaires'] as List;
    List<String> postesList = postesFromJson.map((i) => i.toString()).toList();

    return Joueur(
      id: json['id'],
      nom: json['nom'],
      position: json['position'],
      age: json['age'],
      dateNaissance: json['dateNaissance'],
      pointure: json['pointure'],
      essaisMarques: json['essaisMarques'],
      cartons: cartonsList,
      postesSecondaires: postesList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'position': position,
      'age': age,
      'dateNaissance': dateNaissance,
      'pointure': pointure,
      'essaisMarques': essaisMarques,
      'cartons': cartons,
      'postesSecondaires': postesSecondaires,
    };
  }
}