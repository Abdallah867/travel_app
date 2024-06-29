import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/constants/app_constants.dart';

import 'core/routes/app_router.dart';
import 'core/services/service_locator.dart';
import 'core/utils/app_colors.dart';
import 'generated/l10n.dart';
import 'simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await dotenv.load(fileName: ".env");

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
        locale: const Locale('ar'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        routerConfig: AppRouter.router,
        theme: ThemeData(
          textTheme: GoogleFonts.k2dTextTheme(),
          colorScheme: ColorScheme.fromSeed(
            surface: AppColors.backgroundColor,
            seedColor: AppColors.greyColor,
          ),
        ),
      ),
    );
  }
}
