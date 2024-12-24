import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/networking/database_service.dart';
import '../../../home/data/models/agency_model.dart';
import 'agencies_repo.dart';

class AgenciesRepoImpl implements AgenciesRepo {
  final DatabaseService database;

  const AgenciesRepoImpl({required this.database});
  @override
  Future<Either<List<AgencyModel>, Failure>> getAgencies({
    String searchTerm = '',
    String? lastId,
  }) async {
    try {
      List<String> queries = [
        Query.limit(AppConstants.pageSize),
        Query.orderDesc("\$createdAt")
      ];

      if (lastId != null) {
        queries.add(Query.cursorAfter(lastId));
      }

      // if (departureDate != null) {
      //   queries.add(Query.equal("returnDate", returnDate));
      // }

      final response = await database.getList(
          endpoint: AppConstants.agenciesCollectionEndpoint, queries: queries);

      log('${response[0]}');

      List<AgencyModel> agenciesList =
          response.map((agency) => AgencyModel.fromMap(agency.data)).toList();

      return left(agenciesList);
    } on AppwriteException catch (e) {
      return right(
        Failure(errMessage: e.message ?? 'Some unexpected error occurred'),
      );
    } catch (e) {
      return right(
        Failure(errMessage: e.toString()),
      );
    }
  }

  @override
  Future<Either<void, Failure>> createTestAgenciesList() async {
    try {
      final List<AgencyModel> algerianAgencies = [
        // const AgencyModel(
        //   agencyId: 'DZ001',
        //   agnecyName: 'Alger Voyages',
        //   agencyLogo: 'https://example.com/logos/alger_voyages.png',
        //   description: 'Explore Algeria with our curated travel packages.',
        //   email: 'contact@algervoyages.dz',
        //   phoneNumbers: ['0770123456', '0550987654'],
        //   address: '12 Rue Didouche Mourad, Algiers, Algeria',
        // ),
        const AgencyModel(
          agencyId: 'DZ002',
          agnecyName: 'Sahara Adventures',
          agencyLogo: 'https://example.com/logos/sahara_adventures.png',
          description: 'Your gateway to the breathtaking Algerian Sahara.',
          email: 'info@saharaadventures.dz',
          phoneNumbers: ['0770654321', '0550654321'],
          address: '45 Avenue de l’Indépendance, Tamanrasset, Algeria',
        ),
        const AgencyModel(
          agencyId: 'DZ003',
          agnecyName: 'Oran Escapades',
          agencyLogo: 'https://example.com/logos/oran_escapades.png',
          description: 'Discover the beauty of Oran and its surroundings.',
          email: 'hello@oranescapades.dz',
          phoneNumbers: ['0770112233', '0550443322'],
          address: '32 Boulevard de la Victoire, Oran, Algeria',
        ),
        const AgencyModel(
          agencyId: 'DZ004',
          agnecyName: 'Kabylie Treks',
          agencyLogo: 'https://example.com/logos/kabylie_treks.png',
          description: 'Experience the serene landscapes of Kabylie.',
          email: 'support@kabylietreks.dz',
          phoneNumbers: ['0770223344', '0550556677'],
          address: '8 Rue des Jardins, Tizi Ouzou, Algeria',
        ),
        const AgencyModel(
          agencyId: 'DZ005',
          agnecyName: 'Annaba Horizons',
          agencyLogo: 'https://example.com/logos/annaba_horizons.png',
          description:
              'Your perfect travel partner in the vibrant city of Annaba.',
          email: 'contact@annabahorizons.dz',
          phoneNumbers: ['0770334455', '0550667788'],
          address: '14 Boulevard de la Révolution, Annaba, Algeria',
        ),
      ];

      for (AgencyModel a in algerianAgencies) {
        await database.create(
          data: a.toMap(),
          endpoint: AppConstants.agenciesCollectionEndpoint,
          id: ID.unique(),
        );
      }
      return left(null);
    } on AppwriteException catch (e) {
      return right(
        Failure(errMessage: e.message ?? 'Some unexpected error occurred'),
      );
    } catch (e) {
      return right(
        Failure(errMessage: e.toString()),
      );
    }
  }
}
