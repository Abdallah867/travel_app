import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../constants/appwrite_constants.dart';
import '../errors/failure.dart';
import '../services/service_locator.dart';

abstract class DatabaseService {
  Future<Either<Map<String, dynamic>, Failure>> get({
    required String id,
    required String endpoint,
  });

  Future<Either<void, Failure>> create({
    required Map<String, dynamic> data,
    required String endpoint,
  });

  Future<Either<Map<String, dynamic>, Failure>> delete({
    required String id,
    required String endpoint,
  });

  Future<Either<Map<String, dynamic>, Failure>> update({
    required String id,
    required String endpoint,
    required Map<dynamic, dynamic> data,
  });
}

class AppwriteService implements DatabaseService {
  final Databases database = getIt.get<Databases>();
  final String databaseId = AppwriteConstants.databaseId;

  @override
  Future<Either<Map<String, dynamic>, Failure>> get({
    required String id,
    required String endpoint,
  }) async {
    try {
      Document response = await database.getDocument(
        databaseId: databaseId,
        collectionId: AppConstants.appwriteCollections[endpoint]!,
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
    required Map<String, dynamic> data,
    required String endpoint,
  }) async {
    try {
      await database.createDocument(
        databaseId: databaseId,
        collectionId: AppConstants.appwriteCollections[endpoint]!,
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

  @override
  Future<Either<Map<String, dynamic>, Failure>> delete({
    required String id,
    required String endpoint,
  }) async {
    try {
      Document response = await database.deleteDocument(
        databaseId: databaseId,
        collectionId: AppConstants.appwriteCollections[endpoint]!,
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
  Future<Either<Map<String, dynamic>, Failure>> update({
    required String id,
    required String endpoint,
    required Map<dynamic, dynamic> data,
  }) async {
    try {
      Document response = await database.updateDocument(
        databaseId: databaseId,
        collectionId: AppConstants.appwriteCollections[endpoint]!,
        documentId: id,
        data: data,
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
}
