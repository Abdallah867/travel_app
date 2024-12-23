part of 'agencies_bloc.dart';

sealed class AgenciesEvent extends Equatable {
  const AgenciesEvent();

  @override
  List<Object> get props => [];
}

class AgenciesNextPageRequested extends AgenciesEvent {
  const AgenciesNextPageRequested({
    required this.lastId,
  });

  final String? lastId;
}

class AgenciesFailedFetchRetried extends AgenciesEvent {
  const AgenciesFailedFetchRetried();
}

class AgenciesFilterClear extends AgenciesEvent {
  const AgenciesFilterClear();
}

class AgenciesFirstPageFetch extends AgenciesEvent {
  const AgenciesFirstPageFetch();
}

class AgenciesFilterApplied extends AgenciesEvent {
  const AgenciesFilterApplied();
}

class AgenciesSearchTermChanged extends AgenciesEvent {
  const AgenciesSearchTermChanged(
    this.searchTerm,
  );

  final String searchTerm;

  @override
  List<Object> get props => [
        searchTerm,
      ];
}
