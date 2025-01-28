// import 'package:appwrite/appwrite.dart';
// import '../../../../core/utils/date_format_utils.dart';
// import '../../data/models/filter_trips_params.dart';

// class TripsQueryBuilder {
//   /// Builds a list of Appwrite queries based on the provided `FilterTripsParams`.
//   List<String> buildQueries(FilterTripsParams params) {
//     final queries = <String>[];

//     // Add price range query
//     _addPriceQuery(
//       queries,
//       minPrice: params.minPrice,
//       maxPrice: params.maxPrice,
//     );

//     // Add departure date query
//     _addDateQuery(
//       queries,
//       field: "departureDate",
//       betweenStart: params.betweenDepartureDate,
//       betweenEnd: params.andDepartureDate,
//     );

//     // Add return date query
//     _addDateQuery(
//       queries,
//       field: "returnDate",
//       betweenStart: params.betweenReturnDate,
//       betweenEnd: params.andReturnDate,
//     );

//     return queries;
//   }

//   /// Adds a price range query based on `minPrice` and `maxPrice`.
//   void _addPriceQuery(List<String> queries, {double? minPrice, double? maxPrice}) {
//     if (minPrice != null && maxPrice != null) {
//       queries.add(Query.between("price", minPrice, maxPrice));
//     } else if (minPrice != null) {
//       queries.add(Query.greaterThanEqual("price", minPrice));
//     } else if (maxPrice != null) {
//       queries.add(Query.lessThanEqual("price", maxPrice));
//     }
//   }

//   /// Adds a date range query for a specific field (e.g., `departureDate`, `returnDate`).
//   void _addDateQuery(
//     List<String> queries, {
//     required String field,
//     DateTime? betweenStart,
//     DateTime? betweenEnd,
//   }) {
//     if (betweenStart != null && betweenEnd != null) {
//       queries.add(
//         Query.between(
//           field,
//           DateFormatUtils.formatDateToIso8601(betweenStart),
//           DateFormatUtils.formatDateToIso8601(betweenEnd),
//         ),
//       );
//     } else if (betweenStart != null) {
//       queries.add(
//         Query.greaterThanEqual(
//           field,
//           DateFormatUtils.formatDateToIso8601(betweenStart),
//         ),
//       );
//     } else if (betweenEnd != null) {
//       queries.add(
//         Query.lessThanEqual(
//           field,
//           DateFormatUtils.formatDateToIso8601(betweenEnd),
//         ),
//       );
//     }
//   }
// }
// import 'package:appwrite/appwrite.dart';
// import '../../../../core/utils/date_format_utils.dart';
// import '../../data/models/filter_trips_params.dart';

// class TripsQueryBuilder {
//   /// Builds a list of Appwrite queries based on the provided `FilterTripsParams`.
//   List<String> buildQueries(FilterTripsParams params) {
//     final queries = <String>[];

//     // Add price range query
//     _addPriceQuery(
//       queries,
//       minPrice: params.minPrice,
//       maxPrice: params.maxPrice,
//     );

//     // Add departure date query
//     _addDateQuery(
//       queries,
//       field: "departureDate",
//       betweenStart: params.betweenDepartureDate,
//       betweenEnd: params.andDepartureDate,
//     );

//     // Add return date query
//     _addDateQuery(
//       queries,
//       field: "returnDate",
//       betweenStart: params.betweenReturnDate,
//       betweenEnd: params.andReturnDate,
//     );

//     return queries;
//   }

//   /// Adds a price range query based on `minPrice` and `maxPrice`.
//   void _addPriceQuery(List<String> queries, {double? minPrice, double? maxPrice}) {
//     if (minPrice != null && maxPrice != null) {
//       queries.add(Query.between("price", minPrice, maxPrice));
//     } else if (minPrice != null) {
//       queries.add(Query.greaterThanEqual("price", minPrice));
//     } else if (maxPrice != null) {
//       queries.add(Query.lessThanEqual("price", maxPrice));
//     }
//   }

//   /// Adds a date range query for a specific field (e.g., `departureDate`, `returnDate`).
//   void _addDateQuery(
//     List<String> queries, {
//     required String field,
//     DateTime? betweenStart,
//     DateTime? betweenEnd,
//   }) {
//     if (betweenStart != null && betweenEnd != null) {
//       queries.add(
//         Query.between(
//           field,
//           DateFormatUtils.formatDateToIso8601(betweenStart),
//           DateFormatUtils.formatDateToIso8601(betweenEnd),
//         ),
//       );
//     } else if (betweenStart != null) {
//       queries.add(
//         Query.greaterThanEqual(
//           field,
//           DateFormatUtils.formatDateToIso8601(betweenStart),
//         ),
//       );
//     } else if (betweenEnd != null) {
//       queries.add(
//         Query.lessThanEqual(
//           field,
//           DateFormatUtils.formatDateToIso8601(betweenEnd),
//         ),
//       );
//     }
//   }
// }
