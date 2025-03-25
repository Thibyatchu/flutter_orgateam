import 'package:flutter/material.dart';
import '../../utils/api_service.dart';
import '../equipe/equipe_model.dart';
import '../evenement/evenement_model.dart';
import '../models/joueur_model.dart';
import '../joueur/joueur_detail_screen.dart';

class AccueilScreen extends StatelessWidget {
  const AccueilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService('https://api.example.com'); // Remplacez par votre URL d'API

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Événements à venir",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            FutureBuilder<List<Evenement>>(
              future: apiService.fetchEvenements(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No events found');
                } else {
                  final evenements = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: evenements.length,
                    itemBuilder: (context, index) {
                      final evenement = evenements[index];
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            leading: CircleAvatar(
                              backgroundColor: Colors.blue.shade100,
                              child: const Icon(Icons.calendar_today, color: Colors.blue),
                            ),
                            title: Text(evenement.titre, style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text("Date : ${evenement.date}"),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "Équipes",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            FutureBuilder<List<Equipe>>(
              future: apiService.fetchEquipes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No teams found');
                } else {
                  final equipes = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: equipes.length,
                    itemBuilder: (context, index) {
                      final equipe = equipes[index];
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            leading: CircleAvatar(
                              backgroundColor: Colors.green.shade100,
                              child: const Icon(Icons.sports_rugby, color: Colors.green),
                            ),
                            title: Text(equipe.title, style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(equipe.description),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "Top Performers",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            FutureBuilder<List<Joueur>>(
              future: apiService.fetchJoueurs(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No players found');
                } else {
                  final joueursTopPerformers = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: joueursTopPerformers.length,
                    itemBuilder: (context, index) {
                      final joueur = joueursTopPerformers[index];
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            leading: CircleAvatar(
                              backgroundColor: Colors.orange.shade100,
                              child: const Icon(Icons.person, color: Colors.orange),
                            ),
                            title: Text(joueur.nom, style: TextStyle(fontWeight: FontWeight.bold)),
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
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}