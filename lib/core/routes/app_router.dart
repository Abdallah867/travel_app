import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../features/auth/presentation/view/login_view.dart';
import '../../features/auth/presentation/view/register_view.dart';
import '../../features/profile/presentation/manager/cubit/edit_profile_cubit.dart';
import '../../features/reservation/data/repos/reservation_repo_impl.dart';
import '../../features/reservation/presentation/manager/cubit/reservation_cubit.dart';
import '../../features/reservation/presentation/views/reservation_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/profile/presentation/view/edit_profile_view.dart';
import '../../features/trip/presentation/manager/trip_cubit/trip_cubit.dart';
import '../../features/trip/presentation/views/trip_details_view.dart';
import '../../features/trips_list/data/repos/trips_list_repo_impl.dart';
import '../../features/trips_list/presentation/manager/bloc/trips_list_bloc.dart';
import '../../features/trips_list/presentation/views/all_trips_view.dart';
import '../networking/appwrite_service.dart';
import '../services/service_locator.dart';
import 'app_routes.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: AppRoutes.kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: AppRoutes.kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: AppRoutes.kHomeView,
        builder: (context, GoRouterState state) => const HomeView(),
      ),
      GoRoute(
          path: AppRoutes.kTripDetailsView,
          builder: (context, state) {
            final cubits = state.extra as Map<String, dynamic>;
            return MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: cubits['tripCubit'] as TripCubit,
                ),
                BlocProvider.value(
                  value: cubits['currentAccountCubit'] as CurrentAccountCubit,
                ),
              ],
              child: const TripDetailsView(),
            );
          }),
      GoRoute(
          path: AppRoutes.kTripScheduleBookingView,
          builder: (context, GoRouterState state) {
            final cubits = state.extra as Map<String, dynamic>;
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => ReservationCubit(
                    reservationRepo: ReservationRepoImpl(
                      databaseService: getIt.get<AppwriteService>(),
                    ),
                  )..getTripSchedule(state.pathParameters['tripId']!),
                ),
                BlocProvider.value(
                  value: cubits['tripCubit'] as TripCubit,
                ),
                BlocProvider.value(
                  value: cubits['currentAccountCubit'] as CurrentAccountCubit,
                ),
              ],
              child: const ReservationView(),
            );
          }),
      GoRoute(
          path: AppRoutes.kEditProfileView,
          builder: (context, state) {
            final editProfileCubit = state.extra as EditProfileCubit;
            return BlocProvider.value(
              value: editProfileCubit,
              child: const EditProfileView(),
            );
          }),
      GoRoute(
        path: '/all-trips',
        builder: (context, state) => BlocProvider(
          create: (context) =>
              TripsListBloc(tripsListRepo: getIt.get<TripsListRepoImpl>()),
          child: const TripsListView(),
        ),
      ),
    ],
  );
}
