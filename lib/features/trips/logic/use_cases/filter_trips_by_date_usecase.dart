// import 'package:appwrite/appwrite.dart';
// import 'package:dartz/dartz.dart';

// import '../../../../core/constants/app_constants.dart';
// import '../../../../core/errors/failure.dart';
// import '../../../../core/utils/date_format_utils.dart';
// import '../../../trip/data/models/trip_model.dart';
// import '../../data/models/filter_trips_params.dart';
// import '../../data/repos/trips_list_repo.dart';

// class FilterTripsByDateUseCase {
//   final TripsListRepo tripsRepo;

//   FilterTripsByDateUseCase({required this.tripsRepo});

//   Future<Either<List<TripModel>, Failure>> execute(
//       FilterTripsParams filterTripsParams) async {
//     try {
//       // Build the query list
//       final queries = _buildQueries(filterTripsParams);

//       // Fetch trips based on the queries
//       final response = await tripsRepo.getTripsList(queries: queries);

//       // Handle the response
//       return response.fold(
//         (trips) => Left(trips), // Return the list of trips
//         (failure) => Right(failure), // Return the failure
//       );
//     } catch (e) {
//       // Handle unexpected errors
//       return Right(Failure(message: e.toString()));
//     }
//   }

//   List<String> _buildQueries(FilterTripsParams params) {
//     final queries = <String>[];

//     // Add price range query
//     if (params.minPrice != null && params.maxPrice != null) {
//       queries.add(Query.between("price", params.minPrice!, params.maxPrice!));
//     }

//     // Add departure date query
//     if (params.betweenDepartureDate != null &&
//         params.andDepartureDate != null) {
//       queries.add(
//         Query.between(
//           "departureDate",
//           DateFormatUtils.formatDateToIso8601(params.betweenDepartureDate!),
//           DateFormatUtils.formatDateToIso8601(params.andDepartureDate!),
//         ),
//       );
//     } else if (params.betweenDepartureDate != null) {
//       queries.add(
//         Query.greaterThanEqual(
//           "departureDate",
//           DateFormatUtils.formatDateToIso8601(params.betweenDepartureDate!),
//         ),
//       );
//     } else if (params.andDepartureDate != null) {
//       queries.add(
//         Query.lessThanEqual(
//           "departureDate",
//           DateFormatUtils.formatDateToIso8601(params.andDepartureDate!),
//         ),
//       );
//     }

//     // Add return date query
//     if (params.betweenReturnDate != null && params.andReturnDate != null) {
//       queries.add(
//         Query.between(
//           "returnDate",
//           DateFormatUtils.formatDateToIso8601(params.betweenReturnDate!),
//           DateFormatUtils.formatDateToIso8601(params.andReturnDate!),
//         ),
//       );
//     }

//     return queries;
//   }
// }
