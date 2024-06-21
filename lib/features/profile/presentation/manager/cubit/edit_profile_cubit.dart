import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/models/user_model.dart';
import '../../../data/repos/user_profile_repo.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  final UserProfileRepo userProfileRepo;
  bool isButtonDisabled = true;
  UserModel user;

  EditProfileCubit({required this.user, required this.userProfileRepo})
      : super(const EditProfileInformationChanged(isChanged: false));

  Future<void> updateUserData() async {
    emit(EditProfileLoadInProgress());
    final response = await userProfileRepo.updateUserData(
      newUserInformations: updateInformations(),
      password: passwordController.text.trim(),
    );
    passwordController.clear();

    response.fold((updatedUser) {
      user = updatedUser;
      emit(EditProfileSuccess());
    }, (failure) {
      emit(EditProfileFailure(errMessage: failure.errMessage));
    });
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

  void checkIfInformarionsHasBeenChanged() {
    emit(EditProfileInformationChanged(
        isChanged: (!(user == updateInformations()) ? true : false)));
  }

  void setupControllerListeners() {
    emailController.addListener(() => checkIfInformarionsHasBeenChanged());
    usernameController.addListener(() => checkIfInformarionsHasBeenChanged());
    phoneNumberController
        .addListener(() => checkIfInformarionsHasBeenChanged());
  }
}
