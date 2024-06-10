import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<User, Failure>> registerUser({
    required String username,
    required String email,
    required String password,
  });
  Future<Either<Session, Failure>> loginUser({
    required String email,
    required String password,
  });
  Future<User?> currentUserAccount();
  Future<Either<void, Failure>> logoutUser();
}
