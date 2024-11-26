import 'package:flutter/material.dart';
import 'accueil/accueil_screen.dart';
import 'equipe/equipe_screen.dart';
import 'evenement/evenement_screen.dart';
import 'parametre/parametre_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Nombre total d'onglets
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rugby App'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Accueil"),
              Tab(icon: Icon(Icons.sports_rugby), text: "Équipe"),
              Tab(icon: Icon(Icons.event), text: "Événement"),
              Tab(icon: Icon(Icons.settings), text: "Paramètres"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const AccueilScreen(),
            const EquipeScreen(),
            const EvenementScreen(),
            const ParametreScreen(),
          ],
        ),
      ),
    );
  }
}
