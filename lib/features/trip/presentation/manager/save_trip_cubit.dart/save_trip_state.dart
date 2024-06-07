part of 'save_trip_cubit.dart';

sealed class SaveTripState extends Equatable {
  const SaveTripState();

  @override
  List<Object> get props => [];
}

final class SaveTripInitial extends SaveTripState {}

final class SaveTripLoadInProgress extends SaveTripState {}

final class SaveTripSuccess extends SaveTripState {}

final class SaveTripFailure extends SaveTripState {
  final String errMessage;

  const SaveTripFailure({required this.errMessage});
}
