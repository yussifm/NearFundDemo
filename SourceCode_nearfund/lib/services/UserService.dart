import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nearfund/Utils/erro_text.dart';
import 'package:nearfund/models/user_model.dart';

import '../Utils/general_firebaseservice.dart';

abstract class BaseUserService {
  Future<void> createUser({
    required UserModel user,
    required String userId,
  });
  Future getUser({required String userId});
  Future<void> updateUser({required String userId, required UserModel user});
  Future<void> deleteUser({required String userId});
}

final userServiceProvide =
    Provider<Userservice>(((ref) => Userservice(read: ref.read)));

const String cPath = "users";

class Userservice extends BaseUserService {
  final Reader read;

  Userservice({required this.read});
  @override
  Future<void> createUser({
    required UserModel user,
    required String userId,
  }) async {
    try {
      await read(firebaseFstoreProvider)
          .collection(cPath)
          .doc(userId)
          .set(user.toMap());
    } on FirebaseException catch (e) {
      CustormErrorMessageHandle(message: e.message);
    }
  }

  @override
  Future<void> deleteUser({required String userId}) async {
    try {
      await read(firebaseFstoreProvider).collection(cPath).doc(userId).delete();
    } on FirebaseException catch (e) {
      CustormErrorMessageHandle(message: e.message);
    }
  }

  @override
  Future getUser({required String userId}) async {
    try {
      final snap = await read(firebaseFstoreProvider)
          .collection(cPath)
          .doc(userId)
          .get();

      return snap;
    } on FirebaseException catch (e) {
      CustormErrorMessageHandle(message: e.message);
    }
  }

  @override
  Future<void> updateUser(
      {required String userId, required UserModel user}) async {
    try {
      await read(firebaseFstoreProvider)
          .collection(cPath)
          .doc(userId)
          .update(user.toMap());
    } on FirebaseException catch (e) {
      CustormErrorMessageHandle(message: e.message);
    }
  }
}
