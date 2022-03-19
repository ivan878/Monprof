class Classe {
  String? idClasse;
  String? nom;
  String? matieres;
  List<String> Matiere = [];

  Classe({
    this.idClasse,
    this.nom,
    this.matieres,
    required this.Matiere,
  });
}

List<Classe> classe = [
  Classe(
    idClasse: '1',
    nom: 'troisieme',
    matieres: 'nombre de matiere',
    Matiere: [],
  ),
  Classe(
    idClasse: '2',
    nom: 'premiere',
    matieres: 'nombre de matiere en premiere',
    Matiere: [],
  ),
  Classe(
    idClasse: '3',
    nom: 'Terminal',
    matieres: 'nombre de matiere en terminale',
    Matiere: [],
  ),
  Classe(
    idClasse: '4',
    nom: 'N classe',
    matieres: 'nombre de matiere en n classe',
    Matiere: [],
  ),
];
