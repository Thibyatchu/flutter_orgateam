import 'package:flutter/material.dart';
import 'accueil/accueil_screen.dart';
import 'equipe/equipe_screen.dart';
import 'evenement/evenement_screen.dart';
import 'parametre/parametre_screen.dart';
import 'connexion/admin_login_screen.dart'; // Import de l'écran de connexion admin

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Nombre total d'onglets
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rugby App'),
          actions: [
            IconButton(
              icon: const Icon(Icons.admin_panel_settings),
              onPressed: () {
                Navigator.pushNamed(context, '/admin-login');
              },
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Accueil"),
              Tab(icon: Icon(Icons.sports_rugby), text: "Équipe"),
              Tab(icon: Icon(Icons.event), text: "Événement"),
              Tab(icon: Icon(Icons.settings), text: "Paramètres"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AccueilScreen(),
            EquipeScreen(),
            EvenementScreen(),
            ParametreScreen(),
          ],
        ),
      ),
    );
  }
}