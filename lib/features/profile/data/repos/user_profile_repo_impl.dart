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
  final Account account;

  const UserProfileRepoImpl({
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
  Future<Either<UserModel, Failure>> updateUserData(
      {required UserModel newUserInformations}) async {
    try {
      await databaseService.update(
        id: newUserInformations.userId,
        endpoint: AppConstants.profilesCollectionEndpoint,
        data: newUserInformations.toMap(),
      );
      return left(newUserInformations);
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

  // @override
  // Future<Either<UserModel, Failure>> updateUserData(
  //     {required String username, String phoneNumber, String email}) async {
  //   try {
  //     await databaseService.update(
  //       id: newUserInformations.userId,
  //       endpoint: AppConstants.profilesCollectionEndpoint,
  //       data: {
  //         'username': username,
  //         'email': email,
  //         'phoneNumber': phoneNumber,
  //       },
  //     );
  //     return left(newUserInformations);
  //   } on AppwriteException catch (e) {
  //     return right(
  //    Failure(errMessage: e.message ?? 'Some unexpected error occurred'),
  //     );
  //   } catch (e) {
  //     return right(
  //       Failure(errMessage: e.toString()),
  //     );
  //   }
  // }

  @override
  Future<Either<void, Failure>> updateUsername(
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
  Future<Either<void, Failure>> updateEmail(
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
}
