import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final String jenisKelamin;
  final String email;
  final String password;
  final int organic;
  final int worthNonOrganic;
  final int nonWorthNonOrganic;

  UserModel({
    required this.name,
    required this.jenisKelamin,
    required this.email,
    required this.password,
    required this.organic,
    required this.worthNonOrganic,
    required this.nonWorthNonOrganic,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'jenisKelamin': jenisKelamin,
      'email': email,
      'password': password,
      'organic': organic,
      'worthNonOrganic': worthNonOrganic,
      'nonWorthNonOrganic': nonWorthNonOrganic,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      jenisKelamin: json['jenisKelamin'],
      email: json['email'],
      password: json['password'],
      organic: json['organic'],
      worthNonOrganic: json['worthNonOrganic'],
      nonWorthNonOrganic: json['nonWorthNonOrganic'],
    );
  }

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      name: snapshot.get('name'),
      jenisKelamin: snapshot.get('jenisKelamin'),
      email: snapshot.get('email'),
      password: snapshot.get('password'),
      organic: snapshot.get('organic'),
      worthNonOrganic: snapshot.get('worthNonOrganic'),
      nonWorthNonOrganic: snapshot.get('nonWorthNonOrganic'),
    );
  }
}
