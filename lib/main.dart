import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/core/constants/app_constants.dart';

import 'core/routes/app_router.dart';
import 'core/services/service_locator.dart';
import 'core/utils/app_colors.dart';
import 'simple_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();

  setupServiceLocator();
  runApp(
    DevicePreview(
      enabled: kDebugMode,
      builder: (context) => const TravelApp(),
    ),
  );
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        AppConstants.designWidth,
        AppConstants.designHeight,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData(
          textTheme: GoogleFonts.k2dTextTheme(),
          colorScheme: ColorScheme.fromSeed(
            background: AppColors.backgroundColor,
            seedColor: AppColors.greyColor,
          ),
        ),
      ),
    );
  }
}
