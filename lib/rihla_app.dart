import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/constants/app_constants.dart';
import 'core/routes/app_router.dart';
import 'core/utils/app_colors.dart';
import 'features/profile/presentation/manager/settings_cubit/settings_cubit.dart';
import 'generated/l10n.dart';

class RihlaApp extends StatelessWidget {
  const RihlaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: const Size(
            AppConstants.designWidth,
            AppConstants.designHeight,
          ),
          minTextAdapt: true,
          splitScreenMode: true,
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            locale: Locale(
                state is SettingsLanguageChanged ? state.language : 'en'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            routerConfig: AppRouter.router,
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.backgroundColor,
              bottomSheetTheme: const BottomSheetThemeData(
                  backgroundColor: AppColors.backgroundColor),
              textTheme: GoogleFonts.dmSansTextTheme(),
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.secondaryColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
