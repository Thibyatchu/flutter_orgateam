import 'package:flutter/material.dart';
import '../../utils/api_service.dart';
import 'equipe_model.dart';
import '../joueur/joueur_detail_screen.dart';

class EquipeScreen extends StatelessWidget {
  const EquipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService('https://api.example.com'); // Remplacez par votre URL d'API

    return FutureBuilder<List<Equipe>>(
      future: apiService.fetchEquipes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erreur : ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Aucune équipe trouvée'));
        } else {
          final equipes = snapshot.data!;
          return ListView.builder(
            itemCount: equipes.length,
            itemBuilder: (context, index) {
              final equipe = equipes[index];
              return Card(
                elevation: 4, // Ajout d'ombre pour un meilleur design
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue.shade100,
                    child: const Icon(Icons.sports_rugby, color: Colors.blue),
                  ),
                  title: Text(
                    equipe.title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Text(
                    equipe.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.black54),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailEquipeScreen(equipe: equipe),
                      ),
                    );
                  },
                ),
              );
            },
          );
        }
      },
    );
  }
}

class DetailEquipeScreen extends StatelessWidget {
  final Equipe equipe;

  const DetailEquipeScreen({super.key, required this.equipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(equipe.title),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Description de l'équipe
            Text(
              equipe.description,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 16,
                    height: 1.5,
                  ),
            ),
            const SizedBox(height: 20),

            // Section liste des joueurs
            const Text(
              "Liste des joueurs :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Utilisation de `Expanded` dans un `Flexible` pour éviter les erreurs
            Flexible(
              child: ListView.builder(
                itemCount: equipe.joueurs.length,
                itemBuilder: (context, index) {
                  final joueur = equipe.joueurs[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue.shade50,
                        child: const Icon(Icons.person, color: Colors.blue),
                      ),
                      title: Text(
                        joueur.nom,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "Position : ${joueur.position}",
                        style: const TextStyle(color: Colors.black54),
                      ),
                      trailing: const Icon(Icons.arrow_forward, color: Colors.blue),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JoueurDetailScreen(joueur: joueur),
                          ),
                        );
                      },
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