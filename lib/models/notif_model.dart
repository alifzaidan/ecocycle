import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String title;
  final String body;
  final String timestamp;

  NotificationModel({
    required this.title,
    required this.body,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'timestamp': timestamp,
    };
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'],
      body: json['body'],
      timestamp: json['timestamp'],
    );
  }

  factory NotificationModel.fromSnapshot(DocumentSnapshot snapshot) {
    return NotificationModel(
      title: snapshot.get('title'),
      body: snapshot.get('body'),
      timestamp: snapshot.get('timestamp'),
    );
  }
}
