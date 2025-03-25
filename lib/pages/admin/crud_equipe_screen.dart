import 'package:flutter/material.dart';
import '../../utils/api_service.dart';
import '../equipe/equipe_model.dart';

class CrudEquipeScreen extends StatefulWidget {
  const CrudEquipeScreen({super.key});

  @override
  _CrudEquipeScreenState createState() => _CrudEquipeScreenState();
}

class _CrudEquipeScreenState extends State<CrudEquipeScreen> {
  final ApiService apiService = ApiService('https://api.example.com'); // Remplacez par votre URL d'API

  void _addOrEditEquipe(Equipe? equipe) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(equipe == null ? 'Add Team' : 'Edit Team'),
          content: EquipeForm(
            equipe: equipe,
            onSave: (equipe) async {
              if (equipe.id == null) {
                await apiService.createEquipe(equipe);
              } else {
                await apiService.updateEquipe(equipe);
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
      appBar: AppBar(title: const Text('Manage Teams')),
      body: FutureBuilder<List<Equipe>>(
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
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(equipe.title),
                    subtitle: Text(equipe.description),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            _addOrEditEquipe(equipe);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            await apiService.deleteEquipe(equipe.id!);
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
          _addOrEditEquipe(null);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class EquipeForm extends StatefulWidget {
  final Equipe? equipe;
  final Function(Equipe) onSave;

  const EquipeForm({Key? key, this.equipe, required this.onSave}) : super(key: key);

  @override
  _EquipeFormState createState() => _EquipeFormState();
}

class _EquipeFormState extends State<EquipeForm> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;

  @override
  void initState() {
    super.initState();
    _title = widget.equipe?.title ?? '';
    _description = widget.equipe?.description ?? '';
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final equipe = Equipe(title: _title, description: _description, joueurs: []);
      widget.onSave(equipe);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: _title,
            decoration: const InputDecoration(labelText: 'Title'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a title';
              }
              return null;
            },
            onSaved: (value) {
              _title = value!;
            },
          ),
          TextFormField(
            initialValue: _description,
            decoration: const InputDecoration(labelText: 'Description'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a description';
              }
              return null;
            },
            onSaved: (value) {
              _description = value!;
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