import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/constants/app_constants.dart';
import 'core/routes/app_router.dart';
import 'core/routes/deep_link_listener.dart';
import 'core/services/service_locator.dart';
import 'core/utils/app_colors.dart';
import 'features/auth/data/repos/auth_repo_impl.dart';
import 'features/auth/presentation/manager/cubit/email_verification_cubit.dart';
import 'features/auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import 'features/profile/data/repos/user_profile_repo_impl.dart';
import 'features/profile/presentation/manager/settings_cubit/settings_cubit.dart';
import 'generated/l10n.dart';

class RihlaApp extends StatelessWidget {
  const RihlaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CurrentAccountCubit(
                authRepo: getIt.get<AuthRepoImpl>(),
                userProfileRepo: getIt.get<UserProfileRepoImpl>(),
              )..currentUserAccount(),
            ),
            BlocProvider(
              create: (context) => EmailVerificationCubit(
                getIt.get<AuthRepoImpl>(),
              ),
            ),
          ],
          child: Builder(builder: (context) {
            return ScreenUtilInit(
              designSize: const Size(
                AppConstants.designWidth,
                AppConstants.designHeight,
              ),
              minTextAdapt: true,
              splitScreenMode: true,
              child: MaterialApp.router(
                showPerformanceOverlay: false,
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
                routerConfig: AppRouter.setupRouter([
                  context.read<CurrentAccountCubit>().stream,
                  context.read<EmailVerificationCubit>().stream
                ]),
                theme: getTheme(),
              ),
            );
          }),
        );
      },
    );
  }
}

ThemeData getTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: AppColors.whiteColor),
    textTheme: GoogleFonts.urbanistTextTheme(),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.secondaryColor,
    ),
  );
}
