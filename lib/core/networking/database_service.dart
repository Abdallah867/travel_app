import 'package:appwrite/models.dart';

abstract class DatabaseService {
  Future<Map<String, dynamic>> get({
    required String id,
    required String endpoint,
  });

  Future<List<Document>> getList({
    required String endpoint,
    List<String>? queries,
  });

  Future<Map<String, dynamic>> create({
    required Map<String, dynamic> data,
    required String endpoint,
  });

  Future<Map<String, dynamic>> delete({
    required String id,
    required String endpoint,
  });

  Future<Map<String, dynamic>> update({
    required String id,
    required String endpoint,
    required Map<dynamic, dynamic> data,
  });
}
