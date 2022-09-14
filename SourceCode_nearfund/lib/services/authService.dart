import 'package:firebase_auth/firebase_auth.dart';
import 'package:nearfund/Utils/erro_text.dart';
import 'package:nearfund/Utils/general_firebaseservice.dart';
import 'package:riverpod/riverpod.dart';

abstract class BaseAuthServices {
  Stream<User?> get authStateChanges;
  Future<void> signIn({required String email, required String password});
  Future<void> signUp({required String email, required String password});
  User? getCurrentUser();
  Future<void> paasswordRest({required String email});
  Future<User?> signInwithGoogle();
  Future<User?> signInwithFacebook();

  Future<void> signOut();
}

final authServiceProvide =
    Provider<AuthServices>(((ref) => AuthServices(reader: ref.read)));

class AuthServices extends BaseAuthServices {
  final Reader reader;

  AuthServices({required this.reader});

  @override
  Stream<User?> get authStateChanges {
    return reader(firebaseAuthprovider).authStateChanges();
  }

  @override
  Future<void> paasswordRest({required String email}) async {
    try {
      await reader(firebaseAuthprovider).sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      CustormErrorMessageHandle(message: e.message);
    }
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      await reader(firebaseAuthprovider)
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      CustormErrorMessageHandle(message: e.message);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await reader(firebaseAuthprovider).signOut();
    } on FirebaseAuthException catch (e) {
      CustormErrorMessageHandle(message: e.message);
    }
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      await reader(firebaseAuthprovider)
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      CustormErrorMessageHandle(message: e.message);
    }
  }

  @override
  User? getCurrentUser() {
    try {
      return reader(firebaseAuthprovider).currentUser;
    } on FirebaseAuthException catch (e) {
      CustormErrorMessageHandle(message: e.message);
    }
    return null;
  }

  @override
  Future<User?> signInwithGoogle() {
    // TODO: implement signInwithGoogle
    throw UnimplementedError();
  }

  @override
  Future<User?> signInwithFacebook() {
    // TODO: implement signInwithFacebook
    throw UnimplementedError();
  }
}
