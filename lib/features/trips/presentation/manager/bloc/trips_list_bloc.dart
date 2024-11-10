import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../trip/data/models/trip_model.dart';
import '../../../data/repos/trips_list_repo.dart';

part 'trips_list_event.dart';
part 'trips_list_state.dart';

class TripsListBloc extends Bloc<TripsListEvent, TripsListState> {
  final TripsListRepo tripsListRepo;
  TextEditingController betweenDepartureDateController =
      TextEditingController();
  TextEditingController andDepartureDateController = TextEditingController();

  TextEditingController andReturnDateController = TextEditingController();
  TextEditingController betweenReturnDateController = TextEditingController();
  int? _minPrice;
  int? _maxPrice;
  bool isFiltering = false;

  set minPrice(int? minPrice) => _minPrice = minPrice;

  set maxPrice(int? maxPrice) => _maxPrice = maxPrice;

  TripsListBloc({required this.tripsListRepo}) : super(TripsListInitial()) {
    on<TripsListEvent>(
      (event, emit) async {
        if (event is TripsListFilterApplied) {
          await _handleTripsListFilterApplied(emit, event);
        } else if (event is TripsListSearchTermChanged) {
          await _handleTripsListSearchTermChanged(emit, event);
        } else if (event is TripsListRefreshed) {
          // await _handleTripsListRefreshed(emit, event);
        } else if (event is TripsListNextPageRequested) {
          await _handleTripsListNextPageRequested(emit, event);
        } else if (event is TripsListFilterApplied) {
          await _handleTripsListFilterApplied(emit, event);
        } else if (event is TripsListFirstPageFetch) {
          await _handleTripsListFirstPageFetch(emit, event);
        }
      },
    );
  }

  Future<void> _handleTripsListFailedFetchRetried(
      Emitter<TripsListState> emit) async {
    await getTripsList(emit);
  }

  Future<void> _handleTripsListSearchTermChanged(
      Emitter<TripsListState> emit, TripsListSearchTermChanged event) async {
    await getTripsList(emit);
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
    isFiltering = true;
    emit(const TripsListRefreshed());
  }

  Future<void> _handleTripsListFirstPageFetch(
      Emitter<TripsListState> emit, event) async {
    await getTripsList(emit);
  }

  Future<void> getTripsList(Emitter<TripsListState> emit,
      {String? lastId}) async {
    emit(TripsListLoadInProgress());
    Either<List<TripModel>, Failure> response;
    if (isFiltering) {
      response = await tripsListRepo.getFilteredTripsList(
        betweenReturnDate: betweenReturnDateController.text,
        andReturnDate: andReturnDateController.text,
        betweenDepartureDate: betweenDepartureDateController.text,
        andDepartureDate: andDepartureDateController.text,
        maxPrice: _maxPrice ?? AppConstants.maxPrice,
        minPrice: _minPrice ?? AppConstants.minPrice,
      );
    } else {
      response = await tripsListRepo.getTripsList(
        lastId: lastId,
      );
    }
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

  @override
  Future<void> close() async {
    betweenDepartureDateController.dispose();
    andDepartureDateController.dispose();
    betweenReturnDateController.dispose();
    andReturnDateController.dispose();
    super.close();
  }
}
