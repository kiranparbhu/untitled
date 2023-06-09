import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../app_screens/app_screens.dart';
import '../constants/app_constants.dart';
import '../constants/asset_path.dart';
import '../utils/app_styles.dart';
import '../utils/base_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.blue, //or set color with: Color(0xFF0000FF)
    ));
    super.initState();
    Timer(
        const Duration(seconds: 3),
            (){
          Navigator.pushNamed(context, AppScreens.login);
        }
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(

        backgroundColor: AppStyles.primary500Color,
        body: Container(

            width: AppConstants.getFullWidth(context),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageAssetPath.splashBg),
                fit: BoxFit.cover,
              ),
            ),
          ));
  }
}