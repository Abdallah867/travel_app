import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/trip/data/models/trip_model.dart';
import '../../features/trip/presentation/manager/trip_cubit/trip_cubit.dart';
import 'app_routes.dart';
import '../../features/booking/presentation/views/booking_view.dart';
import '../../features/trip/presentation/views/trip_details_view.dart';
import '../../features/auth/presentation/view/login_view.dart';
import '../../features/auth/presentation/view/register_view.dart';
import '../../features/home/presentation/views/home_view.dart';

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
            final tripCubit = state.extra as TripCubit;
            return BlocProvider.value(
              value: tripCubit,
              child: const TripDetailsView(),
            );
          }),
      GoRoute(
        path: AppRoutes.kBookingView,
        builder: (context, GoRouterState state) => const BookingView(),
      ),
    ],
  );
}
