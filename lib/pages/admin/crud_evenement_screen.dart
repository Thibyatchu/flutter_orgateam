import 'package:flutter/material.dart';
import '../../utils/api_service.dart';
import '../evenement/evenement_model.dart';

class CrudEvenementScreen extends StatefulWidget {
  const CrudEvenementScreen({super.key});

  @override
  _CrudEvenementScreenState createState() => _CrudEvenementScreenState();
}

class _CrudEvenementScreenState extends State<CrudEvenementScreen> {
  final ApiService apiService = ApiService('https://api.example.com'); // Remplacez par votre URL d'API

  void _addOrEditEvenement(Evenement? evenement) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(evenement == null ? 'Add Event' : 'Edit Event'),
          content: EvenementForm(
            evenement: evenement,
            onSave: (evenement) async {
              if (evenement.id == null) {
                await apiService.createEvenement(evenement);
              } else {
                await apiService.updateEvenement(evenement);
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
      appBar: AppBar(title: const Text('Manage Events')),
      body: FutureBuilder<List<Evenement>>(
        future: apiService.fetchEvenements(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Aucun événement trouvé'));
          } else {
            final evenements = snapshot.data!;
            return ListView.builder(
              itemCount: evenements.length,
              itemBuilder: (context, index) {
                final evenement = evenements[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(evenement.titre),
                    subtitle: Text(evenement.date),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            _addOrEditEvenement(evenement);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            await apiService.deleteEvenement(evenement.id!);
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
          _addOrEditEvenement(null);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class EvenementForm extends StatefulWidget {
  final Evenement? evenement;
  final Function(Evenement) onSave;

  const EvenementForm({Key? key, this.evenement, required this.onSave}) : super(key: key);

  @override
  _EvenementFormState createState() => _EvenementFormState();
}

class _EvenementFormState extends State<EvenementForm> {
  final _formKey = GlobalKey<FormState>();
  late String _titre;
  late String _date;

  @override
  void initState() {
    super.initState();
    _titre = widget.evenement?.titre ?? '';
    _date = widget.evenement?.date ?? '';
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final evenement = Evenement(titre: _titre, date: _date);
      widget.onSave(evenement);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: _titre,
            decoration: const InputDecoration(labelText: 'Titre'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a title';
              }
              return null;
            },
            onSaved: (value) {
              _titre = value!;
            },
          ),
          TextFormField(
            initialValue: _date,
            decoration: const InputDecoration(labelText: 'Date'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a date';
              }
              return null;
            },
            onSaved: (value) {
              _date = value!;
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