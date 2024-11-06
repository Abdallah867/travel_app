import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/user_model.dart';

abstract class UserProfileRepo {
  Future<Either<UserModel, Failure>> getUserData({required String userId});

  Future<Either<void, Failure>> saveUserData({required User user});

  Future<Either<UserModel, Failure>> updateUserData({
    required UserModel newUserInformations,
  });

  Future<Either<File, Failure>> uploadUserProfilePicture(
      {required String userId, required String path});
  Future<Either<File, Failure>> getUserProfilePicture({required String fileId});

  Future<Either<void, Failure>> deleteUser({required String userId});
  Future<Either<void, Failure>> updateAppwriteAuthUsername(
      {required String newUsername});
  Future<Either<void, Failure>> updateAppwriteAuthEmail(
      {required String newEmail, required String password});
}
