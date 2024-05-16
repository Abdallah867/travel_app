import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../constants/appwrite_constants.dart';
import '../errors/failure.dart';
import '../services/service_locator.dart';

abstract class DatabaseService {
  Future<Either<Map<String, dynamic>, Failure>> get(
      {required String id, required String endpoint});
  Future<Either<void, Failure>> create(
      {required Map<String, dynamic> data, required String endpoint});
}

final List<Map<String, String>> collections = [
  {
    'endpoint': 'profiles',
    'databaseId': AppwriteConstants.databaseId,
    'collectionId': AppwriteConstants.profilesCollectionId,
  },
];

final List<AppwriteService> collectionInfo = collections.map((collection) {
  return AppwriteService(
    database: getIt.get<Databases>(),
    collectionInfo: collection,
  );
}).toList();

class AppwriteService implements DatabaseService {
  final Databases database;
  final Map<String, String> collectionInfo;

  const AppwriteService({
    required this.database,
    required this.collectionInfo,
  });

  @override
  Future<Either<Map<String, dynamic>, Failure>> get({
    required String id,
    required String endpoint,
  }) async {
    try {
      Document response = await database.getDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.profilesCollectionId,
        documentId: id,
      );
      return left(response.data);
    } on AppwriteException catch (e) {
      return right(
        Failure(errMessage: e.message ?? 'Some unexpected error occurred'),
      );
    } catch (e) {
      return right(
        Failure(errMessage: e.toString()),
      );
    }
  }

  @override
  Future<Either<void, Failure>> create({
    required Map<dynamic, dynamic> data,
    required String endpoint,
  }) async {
    try {
      await database.createDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.profilesCollectionId,
        documentId: UniqueKey().toString(),
        data: data,
      );
      return left(null);
    } on AppwriteException catch (e) {
      return right(
        Failure(errMessage: e.message ?? 'Some unexpected error occurred'),
      );
    } catch (e) {
      return right(
        Failure(errMessage: e.toString()),
      );
    }
  }
}
