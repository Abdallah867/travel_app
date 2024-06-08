import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/models/user_model.dart';
import '../../../data/repos/user_profile_repo.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final UserProfileRepo userProfileRepo;

  UserModel user;
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  EditProfileCubit({required this.user, required this.userProfileRepo})
      : super(EditProfileInitial());

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

  Future<void> updateUserData() async {
    emit(EditProfileLoadInProgress());
    final UserModel updatedUserInformations = updateInformations();
    final response = await userProfileRepo.updateUserData(
      newUserInformations: updatedUserInformations,
    );

    response.fold(
      (updatedUser) {
        user = updatedUser;
        emit(EditProfileSuccess());
      },
      (failure) => emit(EditProfileFailure(errMessage: failure.errMessage)),
    );
  }
}
