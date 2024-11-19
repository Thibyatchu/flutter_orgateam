import 'package:flutter/material.dart';
import 'equipe_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.equipe});

  final Equipe equipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(equipe.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              equipe.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            const Text(
              "Liste des joueurs :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: equipe.joueurs.length,
                itemBuilder: (context, index) {
                  final joueur = equipe.joueurs[index];
                  final String nom = joueur["nom"] ?? "Nom indisponible";
                  final String position = joueur["position"] ?? "Position inconnue";
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      leading: const Icon(Icons.person, color: Colors.blue),
                      title: Text(nom),
                      subtitle: Text("Position : $position"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
