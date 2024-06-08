part of 'current_account_cubit.dart';

class CurrentAccountState {}

final class CurrentAccountInitial extends CurrentAccountState {}

final class CurrentAccountLoading extends CurrentAccountState {}

final class UpdateUserInformation extends CurrentAccountState {}

final class CurrentAccountExists extends CurrentAccountState {
  // final User user;

  // CurrentAccountExists({required this.user});
}

final class NoCurrentAccount extends CurrentAccountState {}

final class CurrentAccountFailure extends CurrentAccountState {
  final String errMessage;

  CurrentAccountFailure({required this.errMessage});
}
