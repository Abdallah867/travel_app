part of 'trips_list_bloc.dart';

sealed class TripsListEvent extends Equatable {
  const TripsListEvent();

  @override
  List<Object> get props => [];
}

class TripsListRefreshed extends TripsListEvent {
  const TripsListRefreshed();
}

class TripsListNextPageRequested extends TripsListEvent {
  const TripsListNextPageRequested({
    required this.lastId,
  });

  final String? lastId;
}

class TripsListFailedFetchRetried extends TripsListEvent {
  const TripsListFailedFetchRetried();
}

class TripsListFirstPageFetch extends TripsListEvent {
  const TripsListFirstPageFetch();
}

class TripsListFilterApplied extends TripsListEvent {
  final int? minPrice;
  final int? maxPrice;
  final String? departureDate;
  final String? returnDate;
  const TripsListFilterApplied(
      {this.minPrice, this.maxPrice, this.departureDate, this.returnDate});
}

class TripsListSearchTermChanged extends TripsListEvent {
  const TripsListSearchTermChanged(
    this.searchTerm,
  );

  final String searchTerm;

  @override
  List<Object> get props => [
        searchTerm,
      ];
}
