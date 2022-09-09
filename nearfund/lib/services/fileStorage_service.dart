import 'package:hooks_riverpod/hooks_riverpod.dart';

final fileStorageServiceProvide =
    Provider<FileStorageService>(((ref) => FileStorageService(read: ref.read)));

class FileStorageService {
  final Reader read;
  FileStorageService({required this.read});
}
