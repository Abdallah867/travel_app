import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repos/auth_repo.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final AuthRepo authRepo;
  LogoutCubit({required this.authRepo}) : super(LogoutInitial());
  Future<void> logoutUser() async {
    emit(LogoutLoadInProgress());
    final response = await authRepo.logoutUser();
    response.fold(
      (_) => emit(LogoutSuccess()),
      (failure) => emit(
        LogoutFailure(errMessage: failure.errMessage),
      ),
    );
  }
}
