part of 'agencies_bloc.dart';

sealed class AgenciesState extends Equatable {
  const AgenciesState();

  @override
  List<Object> get props => [];
}

final class AgenciesInitial extends AgenciesState {}

final class AgenciesLoadInProgress extends AgenciesState {}

final class AgenciesRefreshed extends AgenciesState {
  const AgenciesRefreshed();
}

final class AgenciesLoaded extends AgenciesState {
  final List<AgencyModel> agencies;
  const AgenciesLoaded({required this.agencies});
  @override
  List<Object> get props => [agencies];
}

final class AgenciesFailure extends AgenciesState {
  final String errMessage;

  const AgenciesFailure({required this.errMessage});
}
