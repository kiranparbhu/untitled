
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/ui/login.dart';
import 'package:untitled/ui/splash_screen.dart';
import 'package:untitled/utils/app_router.dart';
import 'package:untitled/utils/app_theme.dart';
import 'package:untitled/utils/app_utils.dart';

import 'localizations/app_localization_manager.dart';
import 'localizations/app_localizations.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  final AppRouter _router = AppRouter();
  AlertDialog? dialog;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return StreamBuilder<Locale>(
            stream: AppLocalizationManager().getAppLocale(),
            builder: (context, snapshot) {
              final locale = snapshot.data;
              return MaterialApp(
                navigatorKey: AppUtils.navigatorKey,
                title: 'untitled',
                debugShowCheckedModeBanner: false,
                theme: ThemeUtils.buildAppTheme(context),
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                locale: locale,
                supportedLocales: AppLocalizations.supportedLanguages,
                home: SplashScreen(),
                onGenerateRoute: _router.getRoute,
                navigatorObservers: [_router.routeObserver],
              );
            });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}