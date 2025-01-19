import 'dart:developer';
import 'dart:io';

import 'package:app_links/app_links.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';

import 'core/routes/app_routes.dart';
import 'core/services/service_locator.dart';
import 'features/profile/presentation/manager/settings_cubit/settings_cubit.dart';
import 'rihla_app.dart';
import 'simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();
  await dotenv.load(fileName: ".env");

  setupServiceLocator();
  runApp(
    DevicePreview(
      enabled: kDebugMode && !Platform.isAndroid && !Platform.isIOS,
      builder: (context) => BlocProvider(
        create: (context) => SettingsCubit(),
        child: const RihlaApp(),
      ),
    ),
  );
}
