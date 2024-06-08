import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/networking/database_service.dart';
import '../models/user_model.dart';
import 'user_profile_repo.dart';

class UserProfileRepoImpl implements UserProfileRepo {
  final DatabaseService databaseService;

  const UserProfileRepoImpl({required this.databaseService});

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
  Future<Either<void, Failure>> updateUserData(
      {required UserModel newUserInformations}) async {
    try {
      await databaseService.update(
        id: newUserInformations.userId,
        endpoint: AppConstants.profilesCollectionEndpoint,
        data: newUserInformations.toMap(),
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
