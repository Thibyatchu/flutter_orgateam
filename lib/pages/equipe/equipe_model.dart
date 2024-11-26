import '../models/joueur_model.dart';

class Equipe {
  final String title;
  final String description;
  final List<Joueur> joueurs;

  Equipe(this.title, this.description, this.joueurs);
}

final equipes = [
  Equipe(
    'Équipe 1',
    'Cette équipe participera au Tournoi Régional prévu pour le 5 décembre 2024.',
    [
      Joueur(
        nom: "Antoine Dupont",
        position: "Demi de mêlée",
        age: 27,
        dateNaissance: "15-11-1996", 
        pointure: 42,
        essaisMarques: 8,
        cartons: [
          {"couleur": "jaune", "date": "15-02-2024"}, 
          {"couleur": "rouge", "date": "10-03-2024"}  
        ],
        postesSecondaires: ["Arrière", "Ouverture"],
      ),
      Joueur(
        nom: "Paul Martin",
        position: "Pilier gauche",
        age: 29,
        dateNaissance: "30-06-1994", 
        pointure: 44,
        essaisMarques: 5,
        cartons: [{"couleur": "jaune", "date": "12-04-2024"}], 
        postesSecondaires: ["Deuxième ligne"],
      ),
      Joueur(
        nom: "Damian Penaud",
        position: "Ailier",
        age: 26,
        dateNaissance: "25-02-1997", 
        pointure: 43,
        essaisMarques: 12,
        cartons: [],
        postesSecondaires: ["Centre"],
      ),
    ],
  ),
  Equipe(
    'Équipe 2',
    'Cette équipe jouera un match amical le 12 décembre 2024.',
    [
      Joueur(
        nom: "Julien Bernard",
        position: "Arrière",
        age: 25,
        dateNaissance: "12-01-1999", 
        pointure: 41,
        essaisMarques: 9,
        cartons: [{"couleur": "jaune", "date": "20-02-2024"}], 
        postesSecondaires: ["Ailier", "Demi d’ouverture"],
      ),
      Joueur(
        nom: "Henri Petit",
        position: "Deuxième ligne",
        age: 30,
        dateNaissance: "19-07-1993", 
        pointure: 45,
        essaisMarques: 3,
        cartons: [{"couleur": "rouge", "date": "15-01-2024"}], 
        postesSecondaires: ["Troisième ligne aile"],
      ),
      Joueur(
        nom: "Simon Roux",
        position: "Centre",
        age: 28,
        dateNaissance: "25-05-1995", 
        pointure: 42,
        essaisMarques: 7,
        cartons: [],
        postesSecondaires: ["Ailier"],
      ),
    ],
  ),
  Equipe(
    'Équipe 3',
    'Cette équipe se présentera lors de la Conférence sportive du 20 décembre 2024.',
    [
      Joueur(
        nom: "Patrice Moreau",
        position: "Troisième ligne aile",
        age: 31,
        dateNaissance: "18-03-1992", 
        pointure: 44,
        essaisMarques: 6,
        cartons: [{"couleur": "jaune", "date": "22-03-2024"}], 
        postesSecondaires: ["Deuxième ligne", "Centre"],
      ),
      Joueur(
        nom: "Marc Lefèvre",
        position: "Ouverture",
        age: 27,
        dateNaissance: "08-08-1996", 
        pointure: 42,
        essaisMarques: 10,
        cartons: [{"couleur": "rouge", "date": "10-04-2024"}], 
        postesSecondaires: ["Demi d’ouverture", "Arrière"],
      ),
      Joueur(
        nom: "Paul Garnier",
        position: "Demi d’ouverture",
        age: 24,
        dateNaissance: "01-12-2000", 
        pointure: 43,
        essaisMarques: 11,
        cartons: [],
        postesSecondaires: ["Ouverture", "Centre"],
      ),
    ],
  ),
];
