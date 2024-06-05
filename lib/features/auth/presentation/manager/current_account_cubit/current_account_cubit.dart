import 'dart:developer';

import 'package:appwrite/models.dart';
import 'package:bloc/bloc.dart';

import '../../../../profile/data/models/user_model.dart';
import '../../../../profile/data/repos/user_profile_repo.dart';
import '../../../data/repos/auth_repo.dart';

part 'current_account_state.dart';

class CurrentAccountCubit extends Cubit<CurrentAccountState> {
  final AuthRepo authRepo;
  final UserProfileRepo userProfileRepo;

  CurrentAccountCubit({required this.authRepo, required this.userProfileRepo})
      : super(CurrentAccountInitial());

  User? user;
  UserModel? userInformations;

  Future<void> currentUserAccount() async {
    emit(CurrentAccountLoading());

    User? user = await authRepo.currentUserAccount();
    log(user.toString());

    if (user == null) {
      emit(NoCurrentAccount());
    } else {
      var userInDatabase = await userProfileRepo.getUserData(userId: user.$id);
      userInDatabase.fold(
        (l) {
          userInformations = l;
          emit(CurrentAccountExists());
        },
        (failure) => (CurrentAccountFailure(errMessage: failure.errMessage),),
      );
    }
  }
}
