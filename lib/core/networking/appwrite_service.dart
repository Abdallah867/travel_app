import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../constants/appwrite_constants.dart';
import '../errors/failure.dart';

abstract class DatabaseService {
  Future<Map<String, dynamic>> get({
    required String id,
    required String endpoint,
  });

  Future<Map<String, dynamic>> create({
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
  final Databases database;
  final String databaseId = AppwriteConstants.databaseId;

  AppwriteService({required this.database});

  @override
  Future<Map<String, dynamic>> get({
    required String id,
    required String endpoint,
  }) async {
    Document response = await database.getDocument(
      databaseId: databaseId,
      collectionId: AppConstants.appwriteCollections[endpoint]!,
      documentId: id,
    );
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> create({
    required Map<String, dynamic> data,
    required String endpoint,
  }) async {
    final response = await database.createDocument(
      databaseId: databaseId,
      collectionId: AppConstants.appwriteCollections[endpoint]!,
      documentId: UniqueKey().toString(),
      data: data,
    );
    return response.data;
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
