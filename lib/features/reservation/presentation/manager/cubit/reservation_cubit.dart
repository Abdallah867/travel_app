import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/services/service_locator.dart';
import '../../../data/models/reservation_model.dart';
import '../../../data/models/traveler_model.dart';
import '../../../data/repos/reservation_repo.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  final ReservationRepo reservationRepo;

  ReservationCubit({required this.reservationRepo})
      : super(ReservationInitial());

  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  GlobalKey<FormState> reservationKey = GlobalKey();

  List<TravelerModel> travelersList = [];

  Future<void> saveReservation({
    required String userId,
    required String choosenScheduleTripId,
  }) async {
    final response = await reservationRepo.saveReservation(
      reservation: ReservationModel(
        reservationId: const Uuid().v4(),
        userId: userId,
        choosenScheduleTripId: choosenScheduleTripId,
        travelers: travelersList,
      ),
      travelers: travelersList,
    );

    response.fold(
      (l) => emit(ReservationSuccess()),
      (error) => ReservationFailure(errorMessage: error.errMessage),
    );
  }

  void addTraveler() {
    TravelerModel traveler = TravelerModel(
      nationalId: const Uuid().v4(),
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      gender: 'Male',
      age: int.parse(ageController.text),
    );
    travelersList.add(traveler);
  }

  void removeTraveler(String travelerId) {
    travelersList.removeWhere((element) => element.nationalId == travelerId);
  }
}
