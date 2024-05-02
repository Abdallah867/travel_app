import 'package:appwrite/models.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginKey = GlobalKey();

  LoginCubit({required this.authRepo}) : super(LoginInitial());

  Future<void> loginUser() async {
    emit(LoginLoading());

    var response = await authRepo.loginUser(
        email: 'abdoallahusma5704@gmail.com', password: 'Abdallah23');
    response.fold(
      (session) => emit(LoginSuccess(session: session)),
      (failure) => emit(LoginFailure(errMessage: failure.errMessage)),
    );
  }
}
