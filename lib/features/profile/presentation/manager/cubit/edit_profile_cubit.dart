import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/models/user_model.dart';
import '../../../data/repos/user_profile_repo.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final UserProfileRepo userProfileRepo;
  UserModel user;
  late UserModel updatedUser;
  bool isButtonDisabled = true;
  Map<String, dynamic> updatedUserInformations = {};

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  EditProfileCubit({required this.user, required this.userProfileRepo})
      : super(EditProfileInitial());

  void updateValue(String key, String value) {
    updatedUserInformations[key] = value;
    updatedUser = updateInformations();
    checkIfInformarionsHasBeenChanged();
    log(updatedUserInformations.toString());
    emit(EditProfileInformationChanged(isButtonDisabled: isButtonDisabled));
  }

  void checkIfInformarionsHasBeenChanged() {
    isButtonDisabled = (user == updatedUser ? true : false);
    log('$isButtonDisabled');
  }

  UserModel updateInformations() {
    final updatedUser = user.copyWith(
      email: emailController.text.trim(),
      username: usernameController.text.trim(),
      phoneNumber: phoneNumberController.text.trim(),
    );
    return updatedUser;
  }

  void setInitialValue() {
    usernameController.text = user.username;
    emailController.text = user.email;
    phoneNumberController.text = user.phoneNumber ?? '';
  }

  void setupControllerListeners() {
    emailController
        .addListener(() => updateValue('email', emailController.text));
    usernameController
        .addListener(() => updateValue('username', usernameController.text));
    phoneNumberController.addListener(
        () => updateValue('phoneNumber', phoneNumberController.text));
    passwordController
        .addListener(() => updateValue('password', passwordController.text));
  }

  Future<void> updateUserData() async {
    emit(EditProfileLoadInProgress());
    final response = await userProfileRepo.updateUserData(
      newUserInformations: updatedUserInformations,
      userId: user.userId,
    );

    response.fold(
      (updatedUser) {
        user = updatedUser;
        emit(EditProfileSuccess());
      },
      (failure) => emit(EditProfileFailure(errMessage: failure.errMessage)),
    );
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
