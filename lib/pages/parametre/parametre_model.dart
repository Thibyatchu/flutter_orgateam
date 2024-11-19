class Parametre {
  String langue;
  bool modeSombre;

  Parametre({
    required this.langue,
    required this.modeSombre,
  });

  void changerLangue(String nouvelleLangue) {
    langue = nouvelleLangue;
  }

  void basculerModeSombre() {
    modeSombre = !modeSombre;
  }
}
