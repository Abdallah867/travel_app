part of 'agency_details_cubit.dart';

sealed class AgencyDetailsState extends Equatable {
  const AgencyDetailsState();

  @override
  List<Object> get props => [];
}

final class AgencyDetailsInitial extends AgencyDetailsState {}

final class AgencyDetailsTripsLoding extends AgencyDetailsState {}

final class AgencyDetailsTripsLoaded extends AgencyDetailsState {}

final class AgencyDetailsTripsFailure extends AgencyDetailsState {}
