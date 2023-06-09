import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled/utils/app_dependencies.dart';


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
  await Permission.camera.request();
  await Permission.storage.request();
  HttpOverrides.global = MyHttpOverrides();
  var configuredApp = AppConfig(appName: 'untitled', flavorName: 'prod', apiUrl: apiUrl, oneSignalAppId: '', child:  MyApp());
  setupDependencies(configuredApp);
  runApp(configuredApp);
}