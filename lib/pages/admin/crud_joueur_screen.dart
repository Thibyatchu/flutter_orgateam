import 'package:flutter/material.dart';
import '../../utils/api_service.dart';
import '../models/joueur_model.dart';

class CrudJoueurScreen extends StatefulWidget {
  const CrudJoueurScreen({super.key});

  @override
  _CrudJoueurScreenState createState() => _CrudJoueurScreenState();
}

class _CrudJoueurScreenState extends State<CrudJoueurScreen> {
  final ApiService apiService = ApiService('https://api.example.com'); // Remplacez par votre URL d'API

  void _addOrEditJoueur(Joueur? joueur) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(joueur == null ? 'Add Player' : 'Edit Player'),
          content: JoueurForm(
            joueur: joueur,
            onSave: (joueur) async {
              if (joueur.id == null) {
                await apiService.createJoueur(joueur);
              } else {
                await apiService.updateJoueur(joueur);
              }
              setState(() {});
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manage Players')),
      body: FutureBuilder<List<Joueur>>(
        future: apiService.fetchJoueurs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Aucun joueur trouvé'));
          } else {
            final joueurs = snapshot.data!;
            return ListView.builder(
              itemCount: joueurs.length,
              itemBuilder: (context, index) {
                final joueur = joueurs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(joueur.nom),
                    subtitle: Text(joueur.position),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            _addOrEditJoueur(joueur);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            await apiService.deleteJoueur(joueur.id!);
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addOrEditJoueur(null);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class JoueurForm extends StatefulWidget {
  final Joueur? joueur;
  final Function(Joueur) onSave;

  const JoueurForm({Key? key, this.joueur, required this.onSave}) : super(key: key);

  @override
  _JoueurFormState createState() => _JoueurFormState();
}

class _JoueurFormState extends State<JoueurForm> {
  final _formKey = GlobalKey<FormState>();
  late String _nom;
  late String _position;
  late int _age;
  late String _dateNaissance;
  late int _pointure;
  late int _essaisMarques;

  @override
  void initState() {
    super.initState();
    _nom = widget.joueur?.nom ?? '';
    _position = widget.joueur?.position ?? '';
    _age = widget.joueur?.age ?? 0;
    _dateNaissance = widget.joueur?.dateNaissance ?? '';
    _pointure = widget.joueur?.pointure ?? 0;
    _essaisMarques = widget.joueur?.essaisMarques ?? 0;
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final joueur = Joueur(
        nom: _nom,
        position: _position,
        age: _age,
        dateNaissance: _dateNaissance,
        pointure: _pointure,
        essaisMarques: _essaisMarques,
        cartons: [],
        postesSecondaires: [],
      );
      widget.onSave(joueur);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: _nom,
            decoration: const InputDecoration(labelText: 'Nom'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
            onSaved: (value) {
              _nom = value!;
            },
          ),
          TextFormField(
            initialValue: _position,
            decoration: const InputDecoration(labelText: 'Position'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a position';
              }
              return null;
            },
            onSaved: (value) {
              _position = value!;
            },
          ),
          TextFormField(
            initialValue: _age.toString(),
            decoration: const InputDecoration(labelText: 'Age'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an age';
              }
              return null;
            },
            onSaved: (value) {
              _age = int.parse(value!);
            },
          ),
          TextFormField(
            initialValue: _dateNaissance,
            decoration: const InputDecoration(labelText: 'Date de Naissance'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a birth date';
              }
              return null;
            },
            onSaved: (value) {
              _dateNaissance = value!;
            },
          ),
          TextFormField(
            initialValue: _pointure.toString(),
            decoration: const InputDecoration(labelText: 'Pointure'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a shoe size';
              }
              return null;
            },
            onSaved: (value) {
              _pointure = int.parse(value!);
            },
          ),
          TextFormField(
            initialValue: _essaisMarques.toString(),
            decoration: const InputDecoration(labelText: 'Essais Marqués'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the number of tries scored';
              }
              return null;
            },
            onSaved: (value) {
              _essaisMarques = int.parse(value!);
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _save,
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}