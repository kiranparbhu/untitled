import 'dart:io';

import 'package:col/localizations/app_language.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:col/utils/app_dependencies.dart';


import 'app_config.dart';
import 'main.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

String apiUrl = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  var configuredApp = AppConfig(appName: 'COL', flavorName: 'prod', apiUrl: apiUrl, oneSignalAppId: '', child:  MyApp(appLanguage: AppLanguage()));
  setupDependencies(configuredApp);
  runApp(configuredApp);
}