import 'package:flutter/material.dart';
import 'equipe_model.dart';
import 'detail_screen.dart';

class EquipeScreen extends StatelessWidget {
  const EquipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Données en dur
    final List<Equipe> equipes = [
      Equipe(
        'Équipe 1',
        'Cette équipe participera au Tournoi Régional prévu pour le 5 décembre 2024.',
        [
          {"nom": "Antoine Dupont", "position": "Demi de mêlée"},
          {"nom": "Paul Martin", "position": "Pilier gauche"},
          {"nom": "Damian Penaud", "position": "Aillier"},
        ],
      ),
      Equipe(
        'Équipe 2',
        'Cette équipe jouera un match amical le 12 décembre 2024.',
        [
          {"nom": "Julien Bernard", "position": "Arrière"},
          {"nom": "Henri Petit", "position": "Deuxième ligne"},
          {"nom": "Simon Roux", "position": "Centre"},
        ],
      ),
      Equipe(
        'Équipe 3',
        'Cette équipe présentera lors de la Conférence sportive du 20 décembre 2024.',
        [
          {"nom": "Patrice Moreau", "position": "Troisième ligne aile"},
          {"nom": "Marc Lefèvre", "position": "Ouverture"},
          {"nom": "Paul Garnier", "position": "Demi d’ouverture"},
        ],
      ),
    ];

    return ListView.builder(
      itemCount: equipes.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: const Icon(Icons.sports_rugby, color: Colors.blue),
            ),
            title: Text(
              equipes[index].title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(equipes[index].description),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(equipe: equipes[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
