import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/user_model.dart';

abstract class UserProfileRepo {
  Future<Either<UserModel, Failure>> getUserData({required String userId});

  Future<Either<void, Failure>> saveUserData({required User user});

  Future<Either<UserModel, Failure>> updateUserData({
    required Map<String, dynamic> newUserInformations,
    required String userId,
    required String password,
  });

  Future<Either<void, Failure>> deleteUser({required String userId});
  Future<Either<void, Failure>> updateUsername({required String newUsername});
  Future<Either<void, Failure>> updateEmail(
      {required String newEmail, required String password});
}
