part of 'trip_cubit.dart';

sealed class TripState extends Equatable {
  const TripState();

  @override
  List<Object> get props => [];
}

final class TripLoadInProgress extends TripState {}

final class TripSuccess extends TripState {}

final class TripFailure extends TripState {
  final String errMessage;

  const TripFailure({required this.errMessage});
}
