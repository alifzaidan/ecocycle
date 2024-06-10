import 'package:firebase_database/firebase_database.dart';

class GarbageModel {
  final String name;
  final String description;
  final String funfact;
  final List<String> imageGallery;

  GarbageModel({
    required this.name,
    required this.description,
    required this.funfact,
    required this.imageGallery,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'funfact': funfact,
      'imageGallery': {
        'img1': imageGallery[0],
        'img2': imageGallery[1],
        'img3': imageGallery[2],
      },
    };
  }

  factory GarbageModel.fromMap(Map<dynamic, dynamic> map) {
    return GarbageModel(
      name: map['nama'] ?? '',
      description: map['description'] ?? '',
      funfact: map['funfact'] ?? '',
      imageGallery: [
        map['imageGallery']['img1'] ?? '',
        map['imageGallery']['img2'] ?? '',
        map['imageGallery']['img3'] ?? '',
      ],
    );
  }

  factory GarbageModel.fromJson(Map<String, dynamic> json) {
    return GarbageModel(
      name: json['name'],
      description: json['description'],
      funfact: json['funfact'],
      imageGallery: [
        json['imageGallery']['img1'],
        json['imageGallery']['img2'],
        json['imageGallery']['img3'],
      ],
    );
  }

  factory GarbageModel.fromDataSnapshot(DataSnapshot snapshot) {
    return GarbageModel(
      name: snapshot.child("name").value.toString(),
      description: snapshot.child("description").value.toString(),
      funfact: snapshot.child("funfact").value.toString(),
      imageGallery: [
        snapshot.child("imageGallery").child("img1").value.toString(),
        snapshot.child("imageGallery").child("img2").value.toString(),
        snapshot.child("imageGallery").child("img3").value.toString(),
      ],
    );
  }
}
