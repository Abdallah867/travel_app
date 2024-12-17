import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:cuid2/cuid2.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/enums/reservation_status.dart';
import '../../../data/models/reservation_model.dart';
import '../../../data/models/traveler_model.dart';
import '../../../data/models/trip_schedule_model.dart';
import '../../../data/repos/reservation_repo.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  final ReservationRepo reservationRepo;

  ReservationCubit({this.reservation, required this.reservationRepo})
      : super(ReservationInitial());

  ///TODO: DIVIDE THIS CUBIT INTO RESERVATION CUBIT AND RESERVATION FORM TO HANDLE THE FORM BETTER
  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  List<String> reservationStatusList = ['upcoming', 'previous', 'cancelled'];

  GlobalKey<FormState> travelerKey = GlobalKey();
  ReservationModel? reservation;
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

        if (reservation != null) {
          selectDate(reservation!.tripSchedule.tripScheduleId);
        }

        emit(ReservationScheduleLoaded());
      },
      (failure) => emit(ReservationFailure(errorMessage: failure.errMessage)),
    );
  }

  void setTravelers(List<TravelerModel> travelers) {
    // List<TravelerModel> newTravelersList = [...travelers];

    // travelersList = newTravelersList;

    travelersList = travelers;

    emit(
      ReservationInfoUpdated(
          travelersList: travelersList,
          selectedScheduleId: selectedScheduleId ?? ''),
    );
  }

  Future<void> updateTraveler(TravelerModel updatedTraveler) async {
    emit(ReservationLoadInProgress());
// TODO: to verify if we need to make a copy for travelersList in case of success
    List<TravelerModel> travelerListCopy =
        List<TravelerModel>.from(travelersList);
    travelersList.removeWhere(
        (element) => element.travelerId == updatedTraveler.travelerId);
    travelersList.add(updatedTraveler);
    final response = await reservationRepo.updateTraveler(updatedTraveler);
    response.fold((l) {
      emit(
        ReservationInfoUpdated(
          travelersList: travelersList,
          selectedScheduleId: selectedScheduleId ?? '',
        ),
      );
    }, (error) {
      travelersList = travelerListCopy;
      emit(ReservationFailure(errorMessage: error.errMessage));
      emit(
        ReservationInfoUpdated(
          travelersList: travelersList,
          selectedScheduleId: selectedScheduleId ?? '',
        ),
      );
    });
  }

  void selectDate(String scheduleId) {
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
    required ReservationStatus statusFilter,
  }) async {
    emit(ReservationLoadInProgress());
    final response =
        await reservationRepo.getReservations(userId, statusFilter.name);
    response.fold((l) {
      reservations = l;
      emit(ReservationSuccess());
    }, (error) {
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
    emit(ReservationSaveInProgress());
    final addingTravelers = await addTravelers(travelersList);
    if (selectedScheduleId != null &&
        addingTravelers != false &&
        travelersList.isNotEmpty) {
      final id = cuid(21);
      ID.unique();
      final ReservationModel resevationCredentials = ReservationModel(
        reservationId: id,
        userId: userId,
        tripSchedule: getTripScheduleModel(selectedScheduleId!),
        travelers: travelersList,
      );

      final response = await reservationRepo.saveReservation(
        reservation: resevationCredentials,
        travelers: travelersList,
      );

      response.fold((l) {
        reservation = resevationCredentials;
        emit(ReservationSuccess());
      }, (error) {
        log(error.errMessage);
        emit(ReservationFailure(errorMessage: error.errMessage));
      });
    } else {
      if (selectedScheduleId == null) {
        emit(const ReservationFailure(errorMessage: 'please select a date'));
      }
      if (addingTravelers == false) {
        emit(const ReservationFailure(errorMessage: 'adding travelers error'));
      }

      if (travelersList.isEmpty) {
        emit(const ReservationFailure(
            errorMessage:
                'Reservation Failed: you must add at least one traveler'));
      }
    }
  }

  Future<void> updateReservation() async {
    emit(ReservationSaveInProgress());
    final addingTravelers = await addTravelers(newAddedTravelers());

    if (selectedScheduleId != null &&
        addingTravelers != false &&
        travelersList.isNotEmpty) {
      final updatedReservation = reservation!.copyWith(
        tripSchedule: getTripScheduleModel(selectedScheduleId!),
        travelers: travelersList,
      );
      final response = await reservationRepo.updateReservation(
        updatedReservation: updatedReservation,
      );
      response.fold((l) {
        reservation = updatedReservation;
        emit(ReservationSuccess());
      }, (error) {
        log(error.errMessage);
        emit(ReservationFailure(errorMessage: error.errMessage));
      });
    } else {
      if (selectedScheduleId == null) {
        emit(const ReservationFailure(errorMessage: 'please select a date'));
      }
      if (addingTravelers == false) {
        emit(const ReservationFailure(errorMessage: 'adding travelers error'));
      }
    }
  }

  Future<bool?> addTravelers(List<TravelerModel> travelers) async {
    for (TravelerModel traveler in travelers) {
      final response = await reservationRepo.addTraveler(traveler);
      response.fold((l) {}, (error) {
        emit(ReservationFailure(errorMessage: error.errMessage));
        return false;
      });
    }
    return null;
  }

  List<TravelerModel> newAddedTravelers() {
    List<TravelerModel> addedTravelers = travelersList
        .where((element) => !reservation!.travelers.contains(element))
        .toList();

    return addedTravelers;
  }

  void clearControllers() {
    lastNameController.clear();
    firstNameController.clear();
    ageController.clear();
    genderController.clear();
  }

  void addTraveler() {
    final id = cuid(21);
    if (travelerKey.currentState!.validate() &&
        genderController.text.isNotEmpty) {
      TravelerModel traveler = TravelerModel(
        travelerId: id,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        gender: genderController.text,
        age: int.parse(ageController.text),
      );

      List<TravelerModel> newTravelersList = [...travelersList];
      newTravelersList.add(traveler);
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
