import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uId;
  final String name;
  final String about;
  final String contact;
  final String imgUrl;
  final String userType;
  final String userLink;
  final FieldValue createdAt;

  UserModel(
      {required this.uId,
      required this.name,
      required this.about,
      required this.imgUrl,
      required this.userType,
      required this.userLink,
      required this.contact,
      required this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'name': name,
      'about': about,
      'imgUrl': imgUrl,
      'userType': userType,
      'userLink': userLink,
      'contact': contact,
      'createdAt': createdAt
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uId: map['uId'] ?? '',
      name: map['name'] ?? '',
      about: map['about'] ?? '',
      imgUrl: map['imgUrl'] ?? '',
      userType: map['userType'] ?? '',
      userLink: map['userLink'] ?? '',
      contact: map['contact'] ?? '',
      createdAt: map['createdAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
