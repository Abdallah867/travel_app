part of 'reservation_cubit.dart';

sealed class ReservationState extends Equatable {
  const ReservationState();

  @override
  List<Object> get props => [];
}

final class ReservationInitial extends ReservationState {}

final class ReservationLoadInProgress extends ReservationState {}

final class ReservationSuccess extends ReservationState {}

final class ReservationFailure extends ReservationState {
  final String errorMessage;
  const ReservationFailure({required this.errorMessage});
}
