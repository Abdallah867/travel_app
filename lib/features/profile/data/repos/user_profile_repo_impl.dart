import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/networking/database_service.dart';
import '../models/user_model.dart';
import 'user_profile_repo.dart';

class UserProfileRepoImpl implements UserProfileRepo {
  final DatabaseService databaseService;
  final Account account;
  final Storage storage;

  const UserProfileRepoImpl({
    required this.storage,
    required this.databaseService,
    required this.account,
  });

  @override
  Future<Either<UserModel, Failure>> getUserData(
      {required String userId}) async {
    try {
      final response = await databaseService.get(
        endpoint: AppConstants.profilesCollectionEndpoint,
        id: userId,
      );

      return left(UserModel.fromMap(response));
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
  Future<Either<void, Failure>> saveUserData({required User user}) async {
    try {
      await databaseService.create(
        id: user.$id,
        endpoint: AppConstants.profilesCollectionEndpoint,
        data: {
          'userId': user.$id,
          'username': user.name,
          'email': user.email,
        },
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
  Future<Either<void, Failure>> deleteUser({required String userId}) async {
    try {
      await databaseService.delete(
        id: userId,
        endpoint: AppConstants.profilesCollectionEndpoint,
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
  Future<Either<UserModel, Failure>> updateUserData({
    required UserModel newUserInformations,
  }) async {
    try {
      final response = await databaseService.update(
        id: newUserInformations.userId,
        endpoint: AppConstants.profilesCollectionEndpoint,
        data: newUserInformations.toMap(),
      );
      return left(UserModel.fromMap(response));
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
  Future<Either<void, Failure>> updateAppwriteAuthUsername(
      {required String newUsername}) async {
    try {
      await account.updateName(name: newUsername);
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
  Future<Either<void, Failure>> updateAppwriteAuthEmail(
      {required String newEmail, required String password}) async {
    try {
      await account.updateEmail(email: newEmail, password: password);
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
  Future<Either<File, Failure>> uploadUserProfilePicture(
      {required String userId, required String path}) async {
    try {
      final file = await storage.createFile(
        bucketId: dotenv.env['APPWRITE_PROFILE_BUCKET_ID']!,
        fileId: ID.unique(),
        file: InputFile.fromPath(path: path, filename: '$userId.jpg'),
      );
      return left(file);
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
  Future<Either<File, Failure>> getUserProfilePicture(
      {required String fileId}) async {
    try {
      final file = await storage.getFile(
        bucketId: dotenv.env['APPWRITE_PROFILE_BUCKET_ID']!,
        fileId: fileId,
      );
      return left(file);
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
