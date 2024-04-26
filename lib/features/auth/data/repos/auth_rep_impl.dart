import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final Account account;

  AuthRepoImpl({required this.account});

  @override
  Future<User?> currentUserAccount() async {
    try {
      return await account.get();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Either<Session, Failure>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final Session user = await account.createEmailPasswordSession(
          email: email, password: password);
      return left(user);
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
  Future<Either<User, Failure>> registerUser({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final user = await account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: username,
      );
      return left(user);
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
  Future<Either<Session, Failure>> logoutUser() {
    // TODO: implement logoutUser
    throw UnimplementedError();
  }
}

// getIt.get<Account>()