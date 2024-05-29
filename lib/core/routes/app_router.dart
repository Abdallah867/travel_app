import 'package:go_router/go_router.dart';
import 'package:travel_app/core/routes/app_routes.dart';
import 'package:travel_app/features/booking/presentation/views/booking_view.dart';
import 'package:travel_app/features/trip_details/presentation/views/trip_details_view.dart';
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
            final tripId = state.pathParameters['tripId'];
            return TripDetailsView(
              tripId: tripId!,
            );
          }),
      GoRoute(
        path: AppRoutes.kBookingView,
        builder: (context, GoRouterState state) => const BookingView(),
      ),
    ],
  );
}
