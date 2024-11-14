import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/models/user_model.dart';
import '../../../data/repos/user_profile_repo.dart';

part 'edit_profile_state.dart';

//TODO: ADD CAMERA AUTHORIZATION FOR THE USER
class EditProfileCubit extends Cubit<EditProfileState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  ImageProvider<Object> profileImage =
      const AssetImage("assets/images/anonymous_profile.png");

  final UserProfileRepo userProfileRepo;
  bool isButtonDisabled = true;
  UserModel user;
  late UserModel updatedUser;

  EditProfileCubit({required this.user, required this.userProfileRepo})
      : super(const EditProfileInformationChanged(isChanged: false));

  Future<void> updateDatabaseUserData(
      {required UserModel newUserInformations}) async {
    emit(EditProfileLoadInProgress());
    final response = await userProfileRepo.updateUserData(
      newUserInformations: newUserInformations,
    );

    response.fold((newUserInfo) {
      user = newUserInfo;
      emit(EditProfileSuccess());
    }, (failure) {
      log(failure.errMessage);
      emit(EditProfileFailure(errMessage: failure.errMessage));
    });
  }

  Future<void> updateUserData() async {
    emit(EditProfileLoadInProgress());
    final emailResponse = await userProfileRepo.updateAppwriteAuthEmail(
      newEmail: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    passwordController.clear();

    emailResponse.fold(
      (l) async {
        final usernameResponse =
            await userProfileRepo.updateAppwriteAuthUsername(
          newUsername: usernameController.text.trim(),
        );

        usernameResponse.fold(
          (l) async {
            await updateDatabaseUserData(newUserInformations: updatedUser);
          },
          (failure) {
            emit(EditProfileFailure(errMessage: failure.errMessage));
          },
        );
      },
      (failure) {
        emit(EditProfileFailure(errMessage: failure.errMessage));
      },
    );
  }

  void setInitialValue() {
    updatedUser = user.copyWith();
    usernameController.text = user.username;
    emailController.text = user.email;
    phoneNumberController.text = user.phoneNumber ?? '';
  }

  void checkIfInformarionsHasBeenChanged() {
    emit(EditProfileInformationChanged(
        isChanged: (user != updatedUser ? true : false)));
  }

  Future<void> selectProfileImage(ImageSource source) async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: source);
    profileImage = FileImage(File(image!.path));
    uploadUserProfilePicture(image.path);
  }

  Future<void> uploadUserProfilePicture(String imagePath) async {
    final response = await userProfileRepo.uploadUserProfilePicture(
      path: imagePath,
      userId: user.userId,
    );

    // Future<void> getProfilePicture() async {
    //   final profilePicture = await userProfileRepo.getUserProfilePicture(
    //       fileId: '66c3ac57c627f2d14618');
    //   profilePicture.fold((file) {
    //     profileImage = FileImage(File());
    //   }, (failure) {
    //     emit(EditProfileFailure(errMessage: failure.errMessage));
    //   });
    // }

    response.fold((file) async {
      final String pictureUrl =
          '{baseUrl}/storage/buckets/{bucketId}/files/{fileId}/preview?project={projectId}'
              .replaceAll('{bucketId}', file.bucketId)
              .replaceAll('{fileId}', file.$id)
              .replaceAll('{projectId}', dotenv.env['APPWRITE_PROJECT_ID']!)
              .replaceAll('{baseUrl}', dotenv.env['APPWRITE_BASE_URL']!);
      print(pictureUrl);
      await updateDatabaseUserData(
        newUserInformations: user.copyWith(
          profilePicture: pictureUrl,
        ),
      );

      print(pictureUrl);

      user = user.copyWith(
        profilePicture: pictureUrl,
      );

      emit(const EditProfileInformationChanged(isChanged: true));
      print("nice!!!!!!!!!!");
    }, (failure) {
      emit(EditProfileFailure(errMessage: failure.errMessage));
      print(failure.errMessage);
    });
  }

  void setupControllerListeners() {
    emailController.addListener(() {
      updatedUser = updatedUser.copyWith(email: emailController.text.trim());
      checkIfInformarionsHasBeenChanged();
    });
    usernameController.addListener(() {
      updatedUser =
          updatedUser.copyWith(username: usernameController.text.trim());
      checkIfInformarionsHasBeenChanged();
    });
    phoneNumberController.addListener(() {
      updatedUser =
          updatedUser.copyWith(phoneNumber: phoneNumberController.text.trim());
      checkIfInformarionsHasBeenChanged();
    });
  }
}
