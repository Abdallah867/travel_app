import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/agencies/data/repos/agencies_repo_impl.dart';
import '../../features/agencies/presentation/manager/bloc/agencies_bloc.dart';
import '../../features/agencies/presentation/views/agencies_view.dart';
import '../../features/auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../features/auth/presentation/view/login_view.dart';
import '../../features/auth/presentation/view/register_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/payment/data/repos/payment_repo_impl.dart';
import '../../features/payment/presentation/manager/cubit/payment_cubit.dart';
import '../../features/payment/presentation/views/checkout_view.dart';
import '../../features/payment/presentation/views/payment_view.dart';
import '../../features/profile/presentation/manager/profile_cubit/edit_profile_cubit.dart';
import '../../features/profile/presentation/view/edit_profile_view.dart';
import '../../features/profile/presentation/view/language_view.dart';
import '../../features/reservation/data/models/reservation_model.dart';
import '../../features/reservation/data/repos/reservation_repo_impl.dart';
import '../../features/reservation/presentation/manager/cubit/reservation_cubit.dart';
import '../../features/reservation/presentation/views/bookings_list_view.dart';
import '../../features/reservation/presentation/views/reservation_view.dart';
import '../../features/reservation/presentation/views/widgets/ticket_screen.dart';
import '../../features/splash_screen/view/splash_screen.dart';
import '../../features/trip/presentation/manager/trip_cubit/trip_cubit.dart';
import '../../features/trip/presentation/views/trip_details_view.dart';
import '../../features/trips/data/repos/trips_list_repo_impl.dart';
import '../../features/trips/presentation/manager/bloc/trips_list_bloc.dart';
import '../../features/trips/presentation/views/trips_view.dart';
import '../services/service_locator.dart';
import 'app_routes.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
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
                    reservationRepo: getIt.get<ReservationRepoImpl>(),
                  )..getTripSchedule(
                      cubits['tripCubit'].trip.tripId!,
                    ),
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
          path: AppRoutes.keditTripScheduleBookingView,
          builder: (context, GoRouterState state) {
            final cubits = state.extra as Map<String, dynamic>;

            return MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: cubits['reservationCubit'] as ReservationCubit,
                ),
                BlocProvider(
                  create: (context) => cubits['tripCubit'] as TripCubit,
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
          path: AppRoutes.kPaymentView,
          builder: (context, state) {
            return BlocProvider(
              create: (context) => PaymentCubit(
                getIt.get<PaymentRepoImpl>(),
                state.extra as ReservationModel,
              ),
              child: const PaymentView(),
            );
          }),
      GoRoute(
          path: AppRoutes.kLanguageView,
          builder: (context, state) {
            return const LanguageView();
          }),
      GoRoute(
        path: AppRoutes.kTrips,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  TripsListBloc(tripsListRepo: getIt.get<TripsListRepoImpl>()),
            ),
            BlocProvider.value(
              value: state.extra as CurrentAccountCubit,
            ),
          ],
          child: const TripsView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.kAgenciesView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  AgenciesBloc(agenciesRepo: getIt.get<AgenciesRepoImpl>()),
            ),
            BlocProvider.value(
              value: state.extra as CurrentAccountCubit,
            ),
          ],
          child: const AgenciesView(),
        ),
      ),
      GoRoute(
          path: AppRoutes.kBookingsView,
          builder: (context, state) {
            return BlocProvider.value(
              value: state.extra as CurrentAccountCubit,
              child: const BookingsListView(),
            );
          }),
      GoRoute(
          path: AppRoutes.kCheckoutView,
          builder: (context, state) {
            final url = state.extra as String;
            return CheckoutView(
              url: url,
            );
          }),
      GoRoute(
          path: AppRoutes.kTicketScreen,
          builder: (context, state) {
            return const TicketScreen();
          }),
    ],
  );
}
