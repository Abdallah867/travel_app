import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../trip/data/models/trip_model.dart';
import '../../../data/models/filter_trips_params.dart';
import '../../../data/repos/trips_list_repo.dart';

part 'trips_list_event.dart';
part 'trips_list_state.dart';

class TripsListBloc extends Bloc<TripsListEvent, TripsListState> {
  final TripsListRepo tripsListRepo;

  int? _minPrice;
  int? _maxPrice;
  set minPrice(int? minPrice) => _minPrice = minPrice;
  set maxPrice(int? maxPrice) => _maxPrice = maxPrice;
  String searchTerm = '';

  bool isFiltering = false;
  TripsListBloc({
    required this.tripsListRepo,
  }) : super(TripsListInitial()) {
    on<TripsListEvent>(
      (event, emit) async {
        //TODO: RECLASSIFY THEM FOR MOST USED TO LAST
        if (event is TripsListFilterApplied) {
          await _handleTripsListFilterApplied(emit, event);
        } else if (event is TripsListSearchTermChanged) {
          _handleTripsListSearchTermChanged(emit, event);
        } else if (event is TripsListRefreshed) {
          // await _handleTripsListRefreshed(emit, event);
        } else if (event is TripsListNextPageRequested) {
          await _handleTripsListNextPageRequested(emit, event);
        } else if (event is TripsListFirstPageFetch) {
          await _handleTripsListFirstPageFetch(emit, event);
        } else if (event is TripsListFilterClear) {
          _handleTripsListFilterClear(emit);
        }
      },
      transformer: (eventStream, eventHandler) {
        final nonDebounceEventStream = eventStream.where(
          (event) => event is! TripsListSearchTermChanged,
        );
        final debounceEventStream = eventStream
// 2
            .whereType<TripsListSearchTermChanged>()
// 3
            .debounceTime(
              const Duration(seconds: 1),
            );
// 4
        //     .where((event) {
        //   final previousFilter = state.TripsListSearchTermChanged;
        //   final previousSearchTerm =
        //       previousFilter is TripsListSearchTermChanged
        //           ? previousFilter.searchTerm
        //           : '';
        //   final isSearchNotAlreadyDisplayed =
        //       event.searchTerm != previousSearchTerm;
        //   return isSearchNotAlreadyDisplayed;
        // });
// 5
        final mergedEventStream = MergeStream([
          nonDebounceEventStream,
          debounceEventStream,
        ]);

        //1

        final restartableTransformer = restartable<TripsListEvent>();
// 2
        return restartableTransformer(mergedEventStream, eventHandler);
      },
    );
  }

  Future<void> _handleTripsListFailedFetchRetried(
      Emitter<TripsListState> emit) async {
    await getTripsList(emit);
  }

  void _handleTripsListFilterClear(Emitter<TripsListState> emit) {
    // betweenDepartureDateController.clear();
    // andDepartureDateController.clear();
    // andReturnDateController.clear();
    // betweenReturnDateController.clear();
    isFiltering = false;
    emit(const TripsListRefreshed());
  }

  void _handleTripsListSearchTermChanged(
      Emitter<TripsListState> emit, TripsListSearchTermChanged searchEvent) {
    log(searchTerm);

    searchTerm = searchEvent.searchTerm;

    emit(const TripsListRefreshed());
    // await getTripsList(emit);
  }

  // Future<void> _handleTripsListRefreshed(
  //     Emitter<TripsListState> emit, TripsListRefreshed event) async {
  //   await getTripsList(emit);
  // }

  Future<void> _handleTripsListNextPageRequested(
      Emitter<TripsListState> emit, TripsListNextPageRequested event) async {
    await getTripsList(emit, lastId: event.lastId);
  }

  Future<void> _handleTripsListFilterApplied(
      Emitter<TripsListState> emit, TripsListFilterApplied event) async {
    final filterTripsParams = event.filterTripsParams.copyWith(
      minPrice: _minPrice,
      maxPrice: _maxPrice,
    );
    final response = await tripsListRepo.getFilteredTripsListFromTripSchedule(
      filterTripsParams: filterTripsParams,
    );

    response.fold((l) {}, (r) {});

    emit(const TripsListRefreshed());
  }

  Future<void> _handleTripsListFirstPageFetch(
      Emitter<TripsListState> emit, event) async {
    await getTripsList(emit);
  }

  Future<void> getTripsList(Emitter<TripsListState> emit,
      {String? lastId}) async {
    emit(TripsListLoadInProgress());
    final response = await tripsListRepo.getTripsList(
      lastId: lastId,
      searchTerm: searchTerm,
    );

    response.fold(
      (trips) {
        emit(TripsListLoaded(trips: trips));
      },
      (failure) {
        log(failure.errMessage);
        emit(TripsListFailure(errMessage: failure.errMessage));
      },
    );
  }
}
