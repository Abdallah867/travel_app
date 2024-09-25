part of 'reservation_cubit.dart';

sealed class ReservationState extends Equatable {
  const ReservationState();

  @override
  List<Object> get props => [];
}

final class ReservationInitial extends ReservationState {}

final class ReservationLoadInProgress extends ReservationState {}

final class ReservationSuccess extends ReservationState {}

final class ReservationScheduleTripsLoaded extends ReservationState {}

final class ReservationFormError extends ReservationState {}

final class ReservationInfoUpdated extends ReservationState {
  final List<TravelerModel> travelersList;
  final String selectedScheduleId;

  const ReservationInfoUpdated({
    required this.travelersList,
    required this.selectedScheduleId,
  });

  @override
  List<Object> get props => [selectedScheduleId, travelersList];
}

final class ReservationFailure extends ReservationState {
  final String errorMessage;
  const ReservationFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
