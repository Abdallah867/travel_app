import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../data/models/reservation_model.dart';
import '../../../data/models/traveler_model.dart';
import '../../../data/models/trip_schedule_model.dart';
import '../../../data/repos/reservation_repo.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  final ReservationRepo reservationRepo;

  ReservationCubit({required this.reservationRepo})
      : super(ReservationInitial());

  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  GlobalKey<FormState> reservationKey = GlobalKey();

  List<TravelerModel> travelersList = [];
  List<TripScheduleModel> tripSchedule = [];

  String? selectedScheduleId;

  Future<void> getTripSchedule(String tripId) async {
    emit(ReservationLoadInProgress());
    final response = await reservationRepo.getTripSchedule(tripId);
    response.fold(
      (l) {
        tripSchedule = l;
        emit(ReservationSuccess());
      },
      (failure) => emit(ReservationFailure(errorMessage: failure.errMessage)),
    );
  }

  void selectDate(scheduleId) {
    selectedScheduleId = scheduleId;
    emit(
      ReservationInfoUpdated(
        selectedScheduleId: scheduleId,
        travelersList: travelersList,
      ),
    );
  }

  Future<void> saveReservation({
    required String userId,
    required String choosenScheduleTripId,
  }) async {
    if (selectedScheduleId != null) {
      final ReservationModel resevationCredentials = ReservationModel(
        reservationId: ID.unique(),
        user: userId,
        tripSchedule: selectedScheduleId!,
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
    TravelerModel traveler = TravelerModel(
      travelerId: ID.unique(),
      nationalId: 'huhuhuhuhhhu88899987654',
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      gender: genderController.text,
      birthday: birthdayController.text,
    );

    List<TravelerModel> updatedTravelerList = [...travelersList, traveler];

    travelersList = updatedTravelerList;

    clearControllers();

    emit(
      ReservationInfoUpdated(
          travelersList: travelersList,
          selectedScheduleId: selectedScheduleId ?? ''),
    );
  }

  void removeTraveler(String travelerId) {
    travelersList.removeWhere((element) => element.nationalId == travelerId);
  }
}
