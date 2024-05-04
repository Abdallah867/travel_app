import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../profile/data/repos/user_profile_repo.dart';
import '../../../data/repos/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo authRepo;
  final UserProfileRepo userProfileRepo;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> registerKey = GlobalKey();

  RegisterCubit({
    required this.authRepo,
    required this.userProfileRepo,
  }) : super(RegisterInitial());

  Future<void> registerUser() async {
    emit(RegisterLoading());

    String username = usernameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    var response = await authRepo.registerUser(
      username: username,
      email: email,
      password: password,
    );
    response.fold(
      (user) async {
        await createNewSessionAndSavingUser(
          email: email,
          password: password,
          user: user,
        );
      },
      (failure) => handleRegistrationError(failure),
    );
  }

  void handleRegistrationError(Failure failure) {
    emit(RegisterFailure(errMessage: failure.errMessage));
  }

  Future<void> createNewSessionAndSavingUser({
    required String email,
    required String password,
    required User user,
  }) async {
    var newSession = await authRepo.loginUser(email: email, password: password);
    newSession.fold(
      (session) async {
        await saveUserProfile(user: user);
      },
      (failure) => handleRegistrationError(failure),
    );
  }

  Future<void> saveUserProfile({required user}) async {
    var savedData = await userProfileRepo.saveUserData(user: user);
    savedData.fold(
      (unit) => emit(RegisterSuccess()),
      (failure) => emit(RegisterFailure(errMessage: failure.errMessage)),
    );
  }
}
