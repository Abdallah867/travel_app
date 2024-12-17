enum ReservationStatus {
  upcoming,
  previous,
  cancelled,
}

extension ReservationStatusName on ReservationStatus {
  String get name {
    switch (this) {
      case ReservationStatus.upcoming:
        return 'upcoming';
      case ReservationStatus.previous:
        return 'previous';
      case ReservationStatus.cancelled:
        return 'cancelled';
    }
  }
}

ReservationStatus getReservationStatusFromIndex(int index) {
  switch (index) {
    case 0:
      return ReservationStatus.upcoming;
    case 1:
      return ReservationStatus.previous;
    case 2:
      return ReservationStatus.cancelled;
    default:
      throw ArgumentError('Invalid index for ReservationStatus: $index');
  }
}
