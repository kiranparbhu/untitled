import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  final String appName;

  // ['prod','dev','local']
  final String flavorName;

  // Api Url
  final String apiUrl;

  final String oneSignalAppId;

  const AppConfig(
      {Key? key,
        required this.appName,
        required this.flavorName,
        required this.apiUrl,
        required this.oneSignalAppId,
        required Widget child})
      : super(key: key, child: child);

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}