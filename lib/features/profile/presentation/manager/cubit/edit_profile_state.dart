part of 'edit_profile_cubit.dart';

sealed class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object> get props => [];
}

final class EditProfileInitial extends EditProfileState {}

final class EditProfileLoadInProgress extends EditProfileState {}

final class EditProfileSuccess extends EditProfileState {}

final class EditProfileInformationChanged extends EditProfileState {
  final bool isChanged;

  const EditProfileInformationChanged({required this.isChanged});
  @override
  List<Object> get props => [isChanged];
}

final class EditProfileFailure extends EditProfileState {
  final String errMessage;

  const EditProfileFailure({required this.errMessage});
}
