import 'package:col/localizations/app_language.dart';
import 'package:col/provider/draft_provider.dart';
import 'package:col/ui/home/inspection_application/bloc/inspectionDetailsBloc/file_download_bloc.dart';
import 'package:col/ui/home/inspection_application/ui/inspection_application.dart';
import 'package:col/ui/home/report_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:col/ui/auth/splash_screen.dart';
import 'package:col/utils/app_router.dart';
import 'package:col/utils/app_theme.dart';
import 'package:col/utils/app_utils.dart';
import 'localizations/app_localization_manager.dart';
import 'localizations/app_localizations.dart';
import 'dart:io';
import 'package:col/utils/app_dependencies.dart';
import 'package:provider/provider.dart';
import 'app_config.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

/// Demo API URL
String apiUrl = 'https://col.devitsandbox.com/api';

///Live API URl
// String apiUrl = 'https://shramsetu.gujarat.gov.in/api';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  var configuredApp = AppConfig(
      appName: 'COL', flavorName: 'dev', apiUrl: apiUrl, oneSignalAppId: '', child: MyApp(appLanguage: appLanguage));
  setupDependencies(configuredApp);

  runApp(configuredApp);
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.appLanguage}) : super(key: key);
  final AppLanguage appLanguage;

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
      designSize: const Size(375, 1080),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<AppLanguage>(
              create: (context) => widget.appLanguage,
            ),
            ChangeNotifierProvider<DraftProvider>(
              create: (context) => DraftProvider(),
            ),
          ],
          child: MultiBlocProvider(
              providers: [
                BlocProvider<FileDownloadBloc>(
                  create: (BuildContext context) => FileDownloadBloc(),
                )
              ],
              child: Consumer<AppLanguage>(builder: (context, model, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  locale: model.appLocal,
                  supportedLocales: [
                    Locale('en', 'US'),
                    Locale('gu', 'IN'),
                  ],
                  localizationsDelegates: [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  home: SplashScreen(),
                  onGenerateRoute: _router.getRoute,
                  navigatorObservers: [_router.routeObserver],
                  theme: ThemeUtils.buildAppTheme(context),
                );
              })),
          // child: Consumer<AppLanguage>(builder: (context, model, child) {
          //   return MaterialApp(
          //     debugShowCheckedModeBanner: false,
          //     locale: model.appLocal,
          //     supportedLocales: [
          //       Locale('en', 'US'),
          //       Locale('gu', 'IN'),
          //     ],
          //     localizationsDelegates: [
          //       AppLocalizations.delegate,
          //       GlobalMaterialLocalizations.delegate,
          //       GlobalWidgetsLocalizations.delegate,
          //       GlobalCupertinoLocalizations.delegate,
          //     ],
          //     home: SplashScreen(),
          //     onGenerateRoute: _router.getRoute,
          //     navigatorObservers: [_router.routeObserver],
          //     theme: ThemeUtils.buildAppTheme(context),
          //   );
          // }),
        );
        // return ChangeNotifierProvider<AppLanguage>(
        //   create: (context) => widget.appLanguage,
        //   child: Consumer<AppLanguage>(builder: (context, model, child) {
        //     return MaterialApp(
        //       debugShowCheckedModeBanner: false,
        //       locale: model.appLocal,
        //       supportedLocales: [
        //         Locale('en', 'US'),
        //         Locale('gu', 'IN'),
        //       ],
        //       localizationsDelegates: [
        //         AppLocalizations.delegate,
        //         GlobalMaterialLocalizations.delegate,
        //         GlobalWidgetsLocalizations.delegate,
        //         GlobalCupertinoLocalizations.delegate,
        //       ],

        //       home: SplashScreen(),
        //       onGenerateRoute: _router.getRoute,
        //       navigatorObservers: [_router.routeObserver], theme: ThemeUtils.buildAppTheme(context),

        //     );
        //   }),
        // );
        /*   return StreamBuilder<Locale>(
            stream: AppLocalizationManager().getAppLocale(),
            builder: (context, snapshot) {
              final locale = snapshot.data;
              return MaterialApp(
                navigatorKey: AppUtils.navigatorKey,
                title: 'col',

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
            });*/
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
