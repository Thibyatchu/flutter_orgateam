import 'package:flutter/material.dart';
import 'crud_equipe_screen.dart';
import 'crud_joueur_screen.dart';
import 'crud_evenement_screen.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CrudEquipeScreen()),
                );
              },
              child: const Text('Manage Teams'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CrudJoueurScreen()),
                );
              },
              child: const Text('Manage Players'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CrudEvenementScreen()),
                );
              },
              child: const Text('Manage Events'),
            ),
          ],
        ),
      ),
    );
  }
}