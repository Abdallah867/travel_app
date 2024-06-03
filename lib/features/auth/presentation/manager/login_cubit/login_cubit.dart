import 'package:appwrite/models.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginCubit({required this.authRepo}) : super(LoginInitial());

  Future<void> loginUser() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    emit(LoginLoading());

    var response = await authRepo.loginUser(email: email, password: password);
    response.fold(
      (session) => emit(LoginSuccess(session: session)),
      (failure) => emit(LoginFailure(errMessage: failure.errMessage)),
    );
  }
}
