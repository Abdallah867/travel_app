import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repos/auth_repo.dart';

part 'email_verification_state.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  final AuthRepo authRepo;
  EmailVerificationCubit(this.authRepo) : super(EmailVerificationInitial());

  Future<void> createEmailVerification() async {
    emit(EmailVerificationLoading());

    var response = await authRepo.verifyUserEmail();
    response.fold((session) {
      emit(EmailVerificationCreated());
    }, (failure) {
      log(failure.errMessage);
      emit(EmailVerificationFailure(errMessage: failure.errMessage));
    });
  }

  Future<void> updateEmailVerification(String userId, String secret) async {
    emit(EmailVerificationLoading());

    var response = await authRepo.updateUserVerification(userId, secret);
    response.fold((_) {
      emit(EmailVerificationUpdate());
    }, (failure) {
      log(failure.errMessage);
      emit(EmailVerificationFailure(errMessage: failure.errMessage));
    });
  }
}
