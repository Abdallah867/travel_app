import 'package:get_it/get_it.dart';
import 'package:appwrite/appwrite.dart';
import '../../features/auth/data/repos/auth_rep_impl.dart';
import '../../features/auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../features/auth/presentation/manager/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/manager/register_cubit/register_cubit.dart';
import '../../features/profile/data/repos/user_profile_repo_impl.dart';
import '../constants/appwrite_constants.dart';
import '../networking/appwrite_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  _setupAppwrite();
  _setupAuth();
  _setupProfile();
}

void _setupAppwrite() {
  getIt.registerSingleton<Client>(Client()
          .setEndpoint(AppwriteConstants.baseUrl)
          .setProject(AppwriteConstants.projectId)
      // .setSelfSigned(status: true),
      );
  getIt.registerSingleton<Account>(Account(getIt.get<Client>()));
  getIt.registerSingleton<Databases>(Databases(getIt.get<Client>()));
  getIt.registerSingleton<AppwriteService>(
    AppwriteService(
      database: getIt.get<Databases>(),
    ),
  );
}

void _setupAuth() {
  getIt.registerFactory(
    () => AuthRepoImpl(
      account: getIt.get<Account>(),
    ),
  );

  getIt.registerLazySingleton(
    () => RegisterCubit(
      authRepo: getIt.get<AuthRepoImpl>(),
      userProfileRepo: getIt.get<UserProfileRepoImpl>(),
    ),
  );
  getIt.registerLazySingleton(
    () => LoginCubit(
      authRepo: getIt.get<AuthRepoImpl>(),
    ),
  );
  getIt.registerLazySingleton(
    () => CurrentAccountCubit(
      authRepo: getIt.get<AuthRepoImpl>(),
      userProfileRepo: getIt.get<UserProfileRepoImpl>(),
    ),
  );
}

void _setupProfile() {
  getIt.registerFactory(
    () => UserProfileRepoImpl(
      databaseService: getIt.get<AppwriteService>(),
    ),
  );
}
