import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nearfund/Utils/general_firebaseservice.dart';

final fileStorageServiceProvide =
    Provider<FileStorageService>(((ref) => FileStorageService(read: ref.read)));

class FileStorageService {
  final Reader read;
  FileStorageService({required this.read});

  Future<String> uploadFiles(
      {required File file, required String pathName}) async {
    //images/userId.png
    try {
      var uploadfile =
          await read(firebaseStorageProvider).ref(pathName).putFile(file);
      return uploadfile.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      return e.message.toString();
    }
  }
}
