import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String postTitle;
  final String postDesc;
  final String imgUrl;
  final FieldValue createdAt;
  final String postLikes;

  PostModel({
    required this.postTitle,
    required this.postDesc,
    required this.imgUrl,
    required this.createdAt,
    required this.postLikes,
  });

  Map<String, dynamic> toMap() {
    return {
      'postTitle': postTitle,
      'postDesc': postDesc,
      'imgUrl': imgUrl,
      'createdAt': createdAt,
      'postLikes': postLikes,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      postTitle: map['postTitle'] ?? '',
      postDesc: map['postDesc'] ?? '',
      imgUrl: map['imgUrl'] ?? '',
      createdAt: map['createdAt'],
      postLikes: map['postLikes'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source));
}
