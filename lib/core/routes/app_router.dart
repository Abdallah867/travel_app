import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/core/routes/app_routes.dart';

import '../../features/auth/presentation/view/login_view.dart';
import '../../features/auth/presentation/view/register_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: AppRoutes.kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: AppRoutes.kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      // GoRoute(
      //   path: AppRoutes.kHomeView,
      //   builder: (context, state) => const HomeView(),
      // ),
    ],
  );
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
