// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'local_storage_service.dart';

class LocalStorageServiceImpl implements LocalStorageService {
  final FlutterSecureStorage storage;
  LocalStorageServiceImpl({
    required this.storage,
  });


  @override
  Future delete(String key) async {
    return await storage.delete(key: key);
  }

  @override
  Future get(String key) async {
    return await storage.read(key: key);
  }

  @override
  Future put(String key, String value) async {
    return await storage.write(key: key, value: value);
  }
}
