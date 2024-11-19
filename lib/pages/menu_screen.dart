import 'package:flutter/material.dart';
import 'equipe/equipe_screen.dart';
import 'evenement/evenement_screen.dart';
import 'parametre/parametre_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Ajout du nouvel onglet
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rugby App'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Accueil"),
              Tab(icon: Icon(Icons.sports_rugby), text: "Équipe"),
              Tab(icon: Icon(Icons.event), text: "Événement"),
              Tab(icon: Icon(Icons.settings), text: "Paramètres"), // Nouvel onglet
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Bienvenue dans l'application Rugby ! Suivez vos équipes, événements et bien plus encore.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const EquipeScreen(),
            const EvenementScreen(),
            const ParametreScreen(), // Nouvel onglet
          ],
        ),
      ),
    );
  }
}
