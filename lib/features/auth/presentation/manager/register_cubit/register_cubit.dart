import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    var response = await authRepo.registerUser(
      username: usernameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    response.fold((user) async {
      var newSession = await authRepo.loginUser(
          email: emailController.text, password: passwordController.text);
      newSession.fold(
        (session) async {
          var savedData = await userProfileRepo.saveUserData(user: user);
          savedData.fold(
            (unit) => emit(RegisterSuccess()),
            (failure) => emit(RegisterFailure(errMessage: failure.errMessage)),
          );
        },
        (failure) => emit(
          RegisterFailure(errMessage: failure.errMessage),
        ),
      );
    }, (failure) {
      emit(RegisterFailure(errMessage: failure.errMessage));
    });
  }
}
