import 'dart:convert';

class Post {
  final int id;
  final String nom;
  final String adresse;
  final String telephone;
  final String email;
  final String typeInstitue;
  final String typeEtablissement;
  final String image;
  final String imageCover;
  final String acronyme;
  final String province;
  final String ville;

  Post({
    required this.id,
    required this.nom,
    required this.adresse,
    required this.telephone,
    required this.email,
    required this.typeInstitue,
    required this.typeEtablissement,
    required this.image,
    required this.imageCover,
    required this.acronyme,
    required this.province,
    required this.ville,


  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      nom: json['nom'],
      adresse: json['adresse'],
      telephone: json['telephone'],
      email: json['email'],
      typeInstitue: json['type_institue'],
      typeEtablissement: json['type_etablissement'],
      image: json['image'],
      imageCover: json['image_cover'],
      acronyme: json['acronyme'],
      province: json['province'],
      ville: json['ville'],


    );
  }

  static List<Post> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Post.fromJson(json)).toList();
  }
}
