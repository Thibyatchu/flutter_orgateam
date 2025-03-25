class Evenement {
  final String titre;
  final String date;

  const Evenement({required this.titre, required this.date});

  factory Evenement.fromJson(Map<String, dynamic> json) {
    return Evenement(
      titre: json['titre'],
      date: json['date'],
    );
  }
}
