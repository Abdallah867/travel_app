import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../constants/appwrite_constants.dart';
import 'database_service.dart';

class AppwriteService implements DatabaseService {
  final Databases database;
  final String databaseId = AppwriteConstants.databaseId;

  const AppwriteService({required this.database});

  @override
  Future<Map<String, dynamic>> get({
    required String id,
    required String endpoint,
  }) async {
    try {
      final Document response = await database.getDocument(
        databaseId: databaseId,
        collectionId: AppConstants.appwriteCollections[endpoint]!,
        documentId: id,
      );
      return response.data;
    } on AppwriteException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> create({
    required Map<String, dynamic> data,
    required String endpoint,
  }) async {
    try {
      final response = await database.createDocument(
        databaseId: databaseId,
        collectionId: AppConstants.appwriteCollections[endpoint]!,
        documentId: UniqueKey().toString(),
        data: data,
      );
      return response.data;
    } on AppwriteException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> delete({
    required String id,
    required String endpoint,
  }) async {
    try {
      final Document response = await database.deleteDocument(
        databaseId: databaseId,
        collectionId: AppConstants.appwriteCollections[endpoint]!,
        documentId: id,
      );
      return response.data;
    } on AppwriteException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> update({
    required String id,
    required String endpoint,
    required Map<dynamic, dynamic> data,
  }) async {
    try {
      final Document response = await database.updateDocument(
        databaseId: databaseId,
        collectionId: AppConstants.appwriteCollections[endpoint]!,
        documentId: id,
        data: data,
      );
      return response.data;
    } on AppwriteException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Document>> getList({required String endpoint, queries}) async {
    try {
      final DocumentList response = await database.listDocuments(
        databaseId: databaseId,
        collectionId: AppConstants.appwriteCollections[endpoint]!,
      );
      return response.documents;
    } on AppwriteException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
