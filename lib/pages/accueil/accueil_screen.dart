import 'package:flutter/material.dart';
import '../equipe/equipe_model.dart';
import '../evenement/evenement_model.dart';
import '../models/joueur_model.dart';
import '../joueur/joueur_detail_screen.dart'; // Import de l'écran détaillé du joueur

class AccueilScreen extends StatelessWidget {
  const AccueilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Evenement> evenements = [
      Evenement(titre: "Tournoi Régional", date: "05-12-2024"),
      Evenement(titre: "Match amical", date: "12-12-2024"),
      Evenement(titre: "Conférence sportive", date: "20-12-2024"),
    ];

    final equipes = [
      Equipe(
        'Équipe 1',
        'Participera au Tournoi Régional prévu pour le 5 décembre 2024.',
        [],
      ),
      Equipe(
        'Équipe 2',
        'Jouera un match amical le 12 décembre 2024.',
        [],
      ),
      Equipe(
        'Équipe 3',
        'Présentera lors de la Conférence sportive du 20 décembre 2024.',
        [],
      ),
    ];

    final List<Joueur> joueursTopPerformers = [
      Joueur(
        nom: "Damian Penaud",
        position: "Ailier",
        age: 26,
        dateNaissance: "25-02-1997",
        pointure: 43,
        essaisMarques: 12,
        cartons: [],
        postesSecondaires: ["Centre"],
      ),
      Joueur(
        nom: "Paul Garnier",
        position: "Demi d’ouverture",
        age: 24,
        dateNaissance: "01-12-2000",
        pointure: 43,
        essaisMarques: 11,
        cartons: [],
        postesSecondaires: ["Ouverture", "Centre"],
      ),
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Événements à venir",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: evenements.length,
              itemBuilder: (context, index) {
                final evenement = evenements[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.shade100,
                      child: const Icon(Icons.calendar_today, color: Colors.blue),
                    ),
                    title: Text(evenement.titre),
                    subtitle: Text("Date : ${evenement.date}"),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "Équipes",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: equipes.length,
              itemBuilder: (context, index) {
                final equipe = equipes[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green.shade100,
                      child: const Icon(Icons.sports_rugby, color: Colors.green),
                    ),
                    title: Text(equipe.title),
                    subtitle: Text(equipe.description),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "Top Performers",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: joueursTopPerformers.length,
              itemBuilder: (context, index) {
                final joueur = joueursTopPerformers[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.orange.shade100,
                      child: const Icon(Icons.person, color: Colors.orange),
                    ),
                    title: Text(joueur.nom),
                    subtitle: Text(
                      "Position : ${joueur.position}\nEssais marqués : ${joueur.essaisMarques}",
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.info, color: Colors.blue),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JoueurDetailScreen(joueur: joueur),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
