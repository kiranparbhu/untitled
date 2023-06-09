import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../api_client/dio_client.dart';
import '../app_config.dart';
import '../preferences/preferences_manager.dart';


final GetIt _getIt = GetIt.instance;

void setupDependencies(AppConfig config) {
  // Logger
  _getIt.registerSingleton<Logger>(Logger());

  //Register AppConfig
  _getIt.registerSingleton<AppConfig>(config);

  // Preference Manager
  _getIt.registerSingleton<PreferencesManager>(PreferencesManager());

  // DIO HTTP Client
  _getIt.registerSingleton<Dio>(DioClient(config).getDio());


}