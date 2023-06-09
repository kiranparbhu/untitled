import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import '../localizations/app_localizations.dart';
import 'app_language.dart';
import 'app_styles.dart';

class AppUtils {
  AppUtils._();

  static AlertDialog? dialog;
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static String roleType = "";
  static BehaviorSubject<int> dashboardIndexStream = BehaviorSubject<int>.seeded(0);

  /// used for getting device type
  /// used for getting device type
  /// used for getting device type
  static String getDeviceType() {
    if (Platform.isAndroid) {
      return 'android';
    } else if (Platform.isIOS) {
      return 'ios';
    } else {
      return '';
    }
  }

  // static Future<String?> getDeviceId() async {
  //   return PlatformDeviceId.getDeviceId;
  // }

  static Future<String> getDeviceVersion() async {
    String osVersion = '';
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      osVersion = androidInfo.version.release;
    } else {
      final iosInfo = await DeviceInfoPlugin().iosInfo;
      osVersion = iosInfo.systemVersion ?? '';
    }
    return osVersion;
  }

  static List<AppLanguage> getLanguages() {
    return [
      AppLanguage(name: 'English', code: 'en'),
      AppLanguage(name: 'عربي', code: 'ar'),
    ];
  }

  static List<String> numberList() {
    return ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  }

  static int hexStringToHexInt(String hex) {
    hex = hex.replaceFirst('#', '');
    hex = hex.length == 6 ? 'ff$hex' : hex;
    int val = int.parse(hex, radix: 16);
    return val;
  }

  static void showSnackBar(BuildContext context, String? text, {bool? isError}) {
    if (text != null && text.isNotEmpty) {
      final snackBar = SnackBar(
        content: Text(text),
        backgroundColor: isError ?? false ? AppStyles.danger500Color : AppStyles.success500Color,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  static void showSnackBarWithAction(BuildContext context, String? text, VoidCallback onPressed, {bool? isError}) {
    if (text != null && text.isNotEmpty) {
      final snackBar = SnackBar(
        dismissDirection: DismissDirection.none,
        behavior: SnackBarBehavior.fixed,
        action: SnackBarAction(label: 'Retry', onPressed: onPressed),
        content: Text(text),
        backgroundColor: isError ?? false ? AppStyles.danger500Color : AppStyles.success500Color,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  static Widget progressHudWidget(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppStyles.primary200Color),
    );
  }

  static Widget getSizedBox(
      BuildContext context, {
        double height = 0,
        double width = 0,
      }) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  static bool checkRequired(String? text) {
    return text?.trim().isNotEmpty ?? false;
  }

  static Widget? checkPassword(String? value) {
    String password = value!.trim();
    RegExp numReg = RegExp(r".*[0-9].*");
    RegExp letterReg = RegExp(r".*[A-Za-z].*");
    Widget? displayText;

    if (password.isEmpty) {
      displayText = const Text('');
    } else if (password.length < 6) {
      displayText = const Text(
        'Weak',
        style: TextStyle(
          color: AppStyles.danger500Color,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      );
    } else if (password.length < 8) {
      displayText = const Text(
        'Short',
        style: TextStyle(
          color: AppStyles.primary200Color,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      );
    } else {
      if (!letterReg.hasMatch(password) || !numReg.hasMatch(password)) {
        // Password length >= 8
        // But doesn't contain both letter and digit characters
        displayText = Text(
          'Strong',
          style: TextStyle(
            color: AppStyles.blue900Color,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        );
      } else {
        // Password length >= 8
        // Password contains both letter and digit characters

        displayText = const Text(
          'Great',
          style: TextStyle(
            color: AppStyles.greenColor,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        );
      }
      return displayText;
    }
    return displayText;
  }

  static String checkConfirmPassword(String? password, String confirmPwd, BuildContext context) {
    if (password == confirmPwd) {
      return '';
    } else {
      return AppLocalizations.of(context)!.translate('pwd_does_not_match');
    }
  }

  static String checkPasswordLength(String? password, BuildContext context) {
    if ((password?.length ?? 0) >= 8) {
      return '';
    } else {
      return AppLocalizations.of(context)!.translate('pwd_greater');
    }
  }

  static showProgress(bool? isVisible, BuildContext? context, {bool isDismissable = false}) {
    if (dialog == null) {
      dialog = const AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Center(
          child: CircularProgressIndicator(
            color: AppStyles.secondary500Color,
          ),
        ),
      );
      if (dialog != null) {
        showDialog(
          context: context!,
          barrierDismissible: isDismissable,
          builder: (x) => dialog!,
        );
      }
    }

    if (isVisible == false) {
      Navigator.of(context!, rootNavigator: true).pop();
      dialog = null;
    }
  }

  static showProgressCon(bool? isVisible, BuildContext? context, {bool isDismissable = false}) {
    Visibility(
      visible: isVisible ?? false,
      child: const Stack(children: [
        Center(
          child: CircularProgressIndicator(
            color: AppStyles.secondary500Color,
          ),
        ),
      ]),
    );
  }

  static showMockedLocationDialog() {
    final context = navigatorKey.currentState?.overlay?.context;
    AlertDialog dialog = AlertDialog(
      content: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.report_outlined,
              color: Colors.redAccent.withOpacity(0.7),
              size: 40,
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text(
                'You are using fake location.Please turn it off.',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
    showDialog(context: context!, builder: (x) => dialog, barrierColor: Colors.transparent, barrierLabel: 'Fake location used');
  }
}

class AppMetaData {
  String os;
  String appVersion;
  String deviceModel;
  String deviceVersion;
  String? deviceId;
  String? manufacturer;

  AppMetaData({required this.os, required this.appVersion, required this.deviceModel, required this.deviceVersion, this.deviceId, this.manufacturer});
}