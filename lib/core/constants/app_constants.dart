class AppConstants {
  static const double designHeight = 851;
  static const double designWidth = 393;
  static const String profilesCollectionEndpoint = 'profiles';
  static const String savesCollectionEndpoint = 'saves';
  static const String tripsCollectionEndpoint = 'trips';
  static const String agenciesCollectionEndpoint = 'agencies';
  static const String travelersCollectionEndpoint = 'travelers';
  static const String reservationsCollectionEndpoint = 'reservations';
  static const String payementsCollectionEndpoint = 'payements';
  static const String tripScheduleCollectionEndpoint = 'tripSchedule';
  static const int minPrice = 500;
  static const int maxPrice = 1000000;

  static const int pageSize = 5;

  static const Map<String, String> appwriteCollections = {
    profilesCollectionEndpoint: '662b840e9331aff1d019',
    savesCollectionEndpoint: '66575dd000095253e61f',
    tripsCollectionEndpoint: '6654b7b100027501e8dc',
    agenciesCollectionEndpoint: '66575ca500179e6a8ee3',
    travelersCollectionEndpoint: '667eb4890027f48f402b',
    reservationsCollectionEndpoint: '667ec1e0000db20a2ab7',
    payementsCollectionEndpoint: '667ec1f1003177117283',
    tripScheduleCollectionEndpoint: '668454dd00240940a70b',
  };
}
