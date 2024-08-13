import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/services/service_locator.dart';
import 'rihla_app.dart';
import 'simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await dotenv.load(fileName: ".env.prod");

  setupServiceLocator();
  runApp(
    const RihlaApp(),
  );
}
