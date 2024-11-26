import 'package:flutter/material.dart';
import '../models/joueur_model.dart';

class JoueurDetailScreen extends StatelessWidget {
  final Joueur joueur;

  const JoueurDetailScreen({super.key, required this.joueur});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(joueur.nom),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // En-tête du joueur
              Center(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Icon(Icons.person, size: 80, color: Colors.blue),
                        const SizedBox(height: 10),
                        Text(
                          joueur.nom,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          joueur.position,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Informations générales
              Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: const Icon(Icons.cake, color: Colors.blue),
                  title: Text("Date de naissance : ${joueur.dateNaissance}"),
                ),
              ),
              Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: const Icon(Icons.calendar_today, color: Colors.blue),
                  title: Text("Âge : ${joueur.age} ans"),
                ),
              ),
              Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: const Icon(Icons.directions_run, color: Colors.blue),
                  title: Text("Pointure : ${joueur.pointure}"),
                ),
              ),
              Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: const Icon(Icons.sports_rugby, color: Colors.blue),
                  title: Text("Essais marqués : ${joueur.essaisMarques}"),
                ),
              ),
              const SizedBox(height: 20),

              // Postes secondaires
              if (joueur.postesSecondaires.isNotEmpty) ...[
                const Text(
                  "Postes secondaires :",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  children: joueur.postesSecondaires
                      .map((poste) => Chip(
                            label: Text(poste),
                            backgroundColor: Colors.blue.shade100,
                          ))
                      .toList(),
                ),
                const SizedBox(height: 20),
              ],

              // Cartons reçus
              if (joueur.cartons.isNotEmpty) ...[
                const Text(
                  "Cartons reçus :",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Column(
                  children: joueur.cartons
                      .map((carton) => Card(
                            elevation: 3,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: ListTile(
                              leading: Icon(
                                carton['couleur'] == 'rouge'
                                    ? Icons.block
                                    : Icons.warning,
                                color: carton['couleur'] == 'rouge'
                                    ? Colors.red
                                    : Colors.yellow,
                              ),
                              title: Text(
                                "Carton ${carton['couleur']}",
                                style: TextStyle(
                                  color: carton['couleur'] == 'rouge'
                                      ? Colors.red
                                      : Colors.yellow.shade800,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text("Date : ${carton['date']}"),
                            ),
                          ))
                      .toList(),
                ),
              ] else ...[
                const Text(
                  "Aucun carton reçu.",
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
