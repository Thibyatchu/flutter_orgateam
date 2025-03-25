class Evenement {
  final int? id;
  final String titre;
  final String date;

  Evenement({this.id, required this.titre, required this.date});

  factory Evenement.fromJson(Map<String, dynamic> json) {
    return Evenement(
      id: json['id'],
      titre: json['titre'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titre': titre,
      'date': date,
    };
  }
}