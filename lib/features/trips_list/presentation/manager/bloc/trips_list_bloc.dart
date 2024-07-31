import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../trip/data/models/trip_model.dart';
import '../../../data/repos/trips_list_repo.dart';

part 'trips_list_event.dart';
part 'trips_list_state.dart';

class TripsListBloc extends Bloc<TripsListEvent, TripsListState> {
  final TripsListRepo tripsListRepo;
  TextEditingController departureDateController = TextEditingController();
  TextEditingController returnDateController = TextEditingController();
  int? _minPrice;
  int? _maxPrice;
  String? _departureDate;
  String? _returnDate;

  set minPrice(int? minPrice) => _minPrice = minPrice;

  set maxPrice(int? maxPrice) => _maxPrice = maxPrice;

  TripsListBloc({required this.tripsListRepo}) : super(TripsListInitial()) {
    on<TripsListEvent>(
      (event, emit) async {
        if (event is TripsListFilterApplied) {
          await _handleTripsListFailedFetchRetried(emit);
        } else if (event is TripsListSearchTermChanged) {
          await _handleTripsListSearchTermChanged(emit, event);
        } else if (event is TripsListRefreshed) {
          await _handleTripsListRefreshed(emit, event);
        } else if (event is TripsListNextPageRequested) {
          _handleTripsListNextPageRequested(emit, event);
        } else if (event is TripsListFilterApplied) {
          await _handleTripsListFilterApplied(emit, event);
        } else if (event is TripsListFirstPageFetch) {
          await _handleTripsListFirstPageFetch(emit, event);
        }
      },
    );
  }

  _handleTripsListFailedFetchRetried(Emitter<TripsListState> emit) async {
    await getTripsList(emit);
  }

  _handleTripsListSearchTermChanged(
      Emitter<TripsListState> emit, TripsListSearchTermChanged event) async {
    await getTripsList(emit);
  }

  _handleTripsListRefreshed(
      Emitter<TripsListState> emit, TripsListRefreshed event) async {
    await getTripsList(emit);
  }

  void _handleTripsListNextPageRequested(
      Emitter<TripsListState> emit, TripsListNextPageRequested event) async {
    await getTripsList(emit, lastId: event.lastId);
  }

  _handleTripsListFilterApplied(
      Emitter<TripsListState> emit, TripsListFilterApplied event) async {
    _minPrice = event.minPrice;
    _maxPrice = event.maxPrice;
    _departureDate = event.departureDate;
    _returnDate = event.returnDate;
    await getTripsList(
      emit,
    );
  }

  Future<void> _handleTripsListFirstPageFetch(
      Emitter<TripsListState> emit, event) async {
    await getTripsList(emit);
  }

  Future<void> getTripsList(Emitter<TripsListState> emit,
      {String? lastId}) async {
    emit(TripsListLoadInProgress());
    final response = await tripsListRepo.getTripsList(
      departureDate: _departureDate,
      returnDate: _returnDate,
      lastId: lastId,
      minPrice: _minPrice ?? AppConstants.minPrice,
      maxPrice: _maxPrice ?? AppConstants.maxPrice,
    );
    response.fold(
      (trips) {
        trips = trips;
        emit(TripsListLoaded(trips: trips));
      },
      (failure) {
        emit(TripsListFailure(errMessage: failure.errMessage));
      },
    );
  }

  @override
  Future<void> close() async {
    departureDateController.dispose();
    returnDateController.dispose();
    super.close();
  }
}
