import 'package:flutter/material.dart';
import 'evenement_model.dart';

class EvenementScreen extends StatelessWidget {
  const EvenementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Données en dur
    final List<Evenement> evenements = [
      Evenement(titre: "Tournoi Régional", date: "05-12-2024"),
      Evenement(titre: "Match amical", date: "12-12-2024"),
      Evenement(titre: "Conférence sportive", date: "20-12-2024"),
    ];

    evenements.sort((a, b) => a.date.compareTo(b.date));

    return ListView.builder(
      itemCount: evenements.length,
      itemBuilder: (context, index) {
        final evenement = evenements[index];
        return Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: const Icon(Icons.calendar_today, color: Colors.blue),
            ),
            title: Text(
              evenement.titre,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Date : ${evenement.date}"),
          ),
        );
      },
    );
  }
}
