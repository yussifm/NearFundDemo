import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod/riverpod.dart';

final firebaseAuthprovider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final firebaseFstoreProvider =
    Provider<FirebaseFirestore>(((ref) => FirebaseFirestore.instance));

final firebaseStorageProvider =
    Provider<FirebaseStorage>(((ref) => FirebaseStorage.instance));
