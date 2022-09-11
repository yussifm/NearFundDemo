import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:nearfund/models/user_model.dart';

class PostModel {
  final String postId;
  final String postTitle;
  final String postDesc;
  final String imgUrl;
  final String postType;
  final FieldValue createdAt;
  final int? postLikes;
  final List<PostCommentModel>? comment;

  PostModel({
    required this.postTitle,
    required this.postDesc,
    required this.imgUrl,
    required this.createdAt,
    this.postLikes = 0,
    required this.postType,
    this.comment,
    required this.postId,
  });

  Map<String, dynamic> toMap() {
    return {
      'postTitle': postTitle,
      'postDesc': postDesc,
      'imgUrl': imgUrl,
      'createdAt': createdAt,
      'postLikes': postLikes,
      'postType': postType,
      'comment': comment,
      'id': postId
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
        postTitle: map['postTitle'] ?? '',
        postDesc: map['postDesc'] ?? '',
        imgUrl: map['imgUrl'] ?? '',
        createdAt: map['createdAt'],
        postLikes: map['postLikes'] ?? '',
        postId: map['id'] ?? '',
        postType: map['postType']);
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source));
}

class PostCommentModel {
  final UserModel user;
  final String commetText;
  final FieldValue createdAt;

  PostCommentModel(
      {required this.user, required this.commetText, required this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'user': user.toMap(),
      'commetText': commetText,
      'createdAt': createdAt
    };
  }

  factory PostCommentModel.fromMap(Map<String, dynamic> map) {
    return PostCommentModel(
        user: UserModel.fromMap(map['user']),
        commetText: map['commetText'] ?? '',
        createdAt: map['createdAt']);
  }

  String toJson() => json.encode(toMap());

  factory PostCommentModel.fromJson(String source) =>
      PostCommentModel.fromMap(json.decode(source));
}
