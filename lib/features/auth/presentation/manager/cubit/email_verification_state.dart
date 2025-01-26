part of 'email_verification_cubit.dart';

sealed class EmailVerificationState extends Equatable {
  const EmailVerificationState();

  @override
  List<Object> get props => [];
}

final class EmailVerificationInitial extends EmailVerificationState {}

final class EmailVerificationCreated extends EmailVerificationState {}

final class EmailVerificationUpdate extends EmailVerificationState {}

final class EmailVerificationLoading extends EmailVerificationState {}

final class EmailVerificationFailure extends EmailVerificationState {
  final String errMessage;

  const EmailVerificationFailure({required this.errMessage});
}
