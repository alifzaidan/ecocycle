import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryModel {
  final String name;
  final String category;
  final String rangePrice;
  final String imageUrl;
  final String timestamp;

  HistoryModel({
    required this.name,
    required this.category,
    required this.rangePrice,
    required this.imageUrl,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'rangePrice': rangePrice,
      'imageUrl': imageUrl,
      'timestamp': timestamp,
    };
  }

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      name: json['name'],
      category: json['category'],
      rangePrice: json['rangePrice'],
      imageUrl: json['imageUrl'],
      timestamp: json['timestamp'],
    );
  }

  factory HistoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    return HistoryModel(
      name: snapshot.get('name'),
      category: snapshot.get('category'),
      rangePrice: snapshot.get('rangePrice'),
      imageUrl: snapshot.get('imageUrl'),
      timestamp: snapshot.get('timestamp'),
    );
  }
}
