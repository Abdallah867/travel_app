import 'dart:developer';

import 'package:appwrite/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../../../generated/l10n.dart';
import '../../../data/models/reservation_model.dart';
import '../../../data/models/traveler_model.dart';
import '../../../data/models/trip_schedule_model.dart';
import '../../../data/repos/reservation_repo.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  final ReservationRepo reservationRepo;

  ReservationCubit({required this.reservationRepo})
      : super(ReservationInitial());

  ///TODO: DIVIDE THIS CUBIT INTO RESERVATION CUBIT AND RESERVATION FORM TO HANDLE THE FORM BETTER
  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  GlobalKey<FormState> travelerKey = GlobalKey();

  List<TravelerModel> travelersList = [];
  List<TripScheduleModel> tripSchedules = [];
  List<ReservationModel> reservations = [];

  String? selectedScheduleId;

  Future<void> getTripSchedule(String tripId) async {
    emit(ReservationLoadInProgress());
    final response = await reservationRepo.getTripSchedule(tripId);
    response.fold(
      (l) {
        tripSchedules = l;
        emit(ReservationSuccess());
      },
      (failure) => emit(ReservationFailure(errorMessage: failure.errMessage)),
    );
  }

  void selectDate(scheduleId) {
    selectedScheduleId = scheduleId;
    emit(
      ReservationInfoUpdated(
        selectedScheduleId: selectedScheduleId!,
        travelersList: travelersList,
      ),
    );
  }

  Future<void> getReservations({
    required String userId,
  }) async {
    emit(ReservationLoadInProgress());
    final response = await reservationRepo.getReservations(userId);
    response.fold((l) {
      reservations = l;
      emit(ReservationSuccess());
    }, (error) {
      log(error.errMessage);
      emit(ReservationFailure(errorMessage: error.errMessage));
    });
  }

  getTripScheduleModel(String scheduleId) {
    return tripSchedules
        .firstWhere((element) => element.tripScheduleId == scheduleId);
  }

  Future<void> saveReservation({
    required String userId,
    required String choosenScheduleTripId,
  }) async {
    emit(ReservationLoadInProgress());
    if (selectedScheduleId != null) {
      final ReservationModel resevationCredentials = ReservationModel(
        reservationId: const Uuid().v4(),
        userId: userId,
        tripSchedule: getTripScheduleModel(selectedScheduleId!),
        travelers: travelersList,
      );

      final response = await reservationRepo.saveReservation(
        reservation: resevationCredentials,
        travelers: travelersList,
      );

      response.fold((l) => emit(ReservationSuccess()), (error) {
        log(error.errMessage);
        emit(ReservationFailure(errorMessage: error.errMessage));
      });
    } else {
      emit(const ReservationFailure(errorMessage: 'please select a date'));
    }
  }

  void clearControllers() {
    lastNameController.clear();
    firstNameController.clear();
    birthdayController.clear();
    genderController.clear();
  }

  void addTraveler() {
    if (travelerKey.currentState!.validate() &&
        genderController.text.isNotEmpty) {
      TravelerModel traveler = TravelerModel(
        travelerId: const Uuid().v4(),
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        gender: genderController.text,
        birthday: birthdayController.text,
      );

      List<TravelerModel> newTravelersList = [...travelersList, traveler];
      travelersList = newTravelersList;

      emit(
        ReservationInfoUpdated(
            travelersList: travelersList,
            selectedScheduleId: selectedScheduleId ?? ''),
      );

      clearControllers();
    } else {
      emit(ReservationFormError());
    }
  }

  void removeTraveler(String travelerId) {
    List<TravelerModel> newTravelersList = travelersList
        .where((element) => element.travelerId != travelerId)
        .toList();

    travelersList = newTravelersList;
    emit(
      ReservationInfoUpdated(
          travelersList: travelersList,
          selectedScheduleId: selectedScheduleId ?? ''),
    );
  }
}
