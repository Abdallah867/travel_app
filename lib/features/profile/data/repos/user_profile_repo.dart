import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/user_model.dart';

abstract class UserProfileRepo {
  Future<Either<UserModel, Failure>> getUserData({required User user});

  Future<Either<Document, Failure>> saveUserData({required User user});

  // Future<Either<UserModel, Failure>> updateUserData();
}
