part of 'bookings_cubit.dart';

sealed class BookingsState extends Equatable {
  const BookingsState();

  @override
  List<Object> get props => [];
}

final class BookingsInitial extends BookingsState {}
