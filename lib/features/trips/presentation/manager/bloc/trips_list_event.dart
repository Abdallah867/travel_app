part of 'trips_list_bloc.dart';

sealed class TripsListEvent extends Equatable {
  const TripsListEvent();

  @override
  List<Object> get props => [];
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

class TripsListFilterClear extends TripsListEvent {
  const TripsListFilterClear();
}

class TripsListFirstPageFetch extends TripsListEvent {
  const TripsListFirstPageFetch();
}

class TripsListFilterApplied extends TripsListEvent {
  final String? searchTerm;
  final FilterTripsParams filterTripsParams;

  const TripsListFilterApplied({
    this.searchTerm,
    required this.filterTripsParams,
  });
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
