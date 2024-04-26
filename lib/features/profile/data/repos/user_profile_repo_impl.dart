import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/constants/appwrite_constants.dart';
import '../../../../core/errors/failure.dart';
import '../models/user_model.dart';
import 'user_profile_repo.dart';

class UserProfileRepoImpl implements UserProfileRepo {
  final Databases database;

  UserProfileRepoImpl({required this.database});

  @override
  Future<Either<UserModel, Failure>> getUserData({required User user}) async {
    try {
      Document response = await database.getDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.profilesCollectionId,
        documentId: user.$id,
      );
      UserModel gottenUser = UserModel.fromMap(response.data);
      return left(gottenUser);
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
  Future<Either<Document, Failure>> saveUserData({required User user}) async {
    try {
      Document document = await database.createDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.profilesCollectionId,
        documentId: user.$id,
        data: {
          'userId': user.$id,
          'username': user.name,
          'email': user.email,
        },
      );

      return left(document);
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
