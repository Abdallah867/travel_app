import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/errors/failure.dart';
import '../../../../home/data/models/agency_model.dart';
import '../../../data/repos/agencies_repo.dart';

part 'agencies_event.dart';
part 'agencies_state.dart';

class AgenciesBloc extends Bloc<AgenciesEvent, AgenciesState> {
  final AgenciesRepo agenciesRepo;
  AgenciesBloc({required this.agenciesRepo}) : super(AgenciesInitial()) {
    on<AgenciesEvent>(
      (event, emit) async {
        if (event is AgenciesSearchTermChanged) {
          await _handleAgenciesSearchTermChanged(emit, event);
        } else if (event is AgenciesRefreshed) {
          // await _handleAgenciesRefreshed(emit, event);
        } else if (event is AgenciesNextPageRequested) {
          await _handleAgenciesNextPageRequested(emit, event);
        } else if (event is AgenciesFirstPageFetch) {
          await _handleAgenciesFirstPageFetch(emit, event);
        }
      },
    );
  }

  Future<void> _handleAgenciesFailedFetchRetried(
      Emitter<AgenciesState> emit) async {
    await getAgencies(emit);
  }

  Future<void> _handleAgenciesSearchTermChanged(
      Emitter<AgenciesState> emit, AgenciesSearchTermChanged event) async {
    await getAgencies(emit);
  }

  // Future<void> _handleAgenciesRefreshed(
  //     Emitter<AgenciesState> emit, AgenciesRefreshed event) async {
  //   await getAgencies(emit);
  // }

  Future<void> _handleAgenciesNextPageRequested(
      Emitter<AgenciesState> emit, AgenciesNextPageRequested event) async {
    await getAgencies(emit, lastId: event.lastId);
  }

  Future<void> _handleAgenciesFirstPageFetch(
      Emitter<AgenciesState> emit, event) async {
    await getAgencies(emit);
  }

  Future<void> getAgencies(Emitter<AgenciesState> emit,
      {String? lastId}) async {
    emit(AgenciesLoadInProgress());
    Either<List<AgencyModel>, Failure> response =
        await agenciesRepo.getAgencies(
      lastId: lastId,
    );

    response.fold(
      (agencies) {
        emit(AgenciesLoaded(agencies: agencies));
      },
      (failure) {
        log(failure.errMessage);
        emit(AgenciesFailure(errMessage: failure.errMessage));
      },
    );
  }
}
