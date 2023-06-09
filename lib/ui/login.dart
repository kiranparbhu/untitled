import 'package:flutter/material.dart';
import 'package:untitled/utils/app_styles.dart';
import 'package:untitled/utils/base_state.dart';
import '../app_screens/app_screens.dart';
import '../constants/app_constants.dart';
import '../constants/asset_path.dart';
import '../utils/app_utils.dart';
import '../widgets/app_custom_button.dart';
import '../widgets/app_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage> {
  bool obscureText = true;
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssetPath.loginBg),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 160),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0)),
            elevation: 10,
            shadowColor: Colors.blue,
            color: Colors.white,
            child: SizedBox(
              width: 350,
              height: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text("OFFICE LOGIN",
                          style: AppStyles.thinLargeTextStyle)),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: AppConstants.DEFAULT_CONTAINER_PADDING,
                        left: AppConstants.DEFAULT_CONTAINER_PADDING,
                        right: AppConstants.DEFAULT_CONTAINER_PADDING),
                    child: AppTextField(
                      titleTextStyle:
                          AppStyles.normalTextStyle.copyWith(fontSize: 16),
                      title: translate('userId'),
                      textInputType: TextInputType.text,
                      controller: _mobileController,
                      validator: (text) {
                        if (!(AppUtils.checkRequired(text))) {
                          return translate('required');
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: AppConstants.TEXT_FORM_FIELD_PADDING,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: AppConstants.DEFAULT_CONTAINER_PADDING,
                        right: AppConstants.DEFAULT_CONTAINER_PADDING),
                    child: AppTextField(
                      titleTextStyle:
                          AppStyles.normalTextStyle.copyWith(fontSize: 16),
                      obscureText: obscureText,
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            obscureText = obscureText ? false : true;
                          });
                        },
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 6,
                            ),
                            child: obscureText
                                ? const Icon(
                                    Icons.visibility_off_sharp,
                                    color: AppStyles.greyIconColor,
                                  )
                                : const Icon(
                                    Icons.visibility_sharp,
                                    color: AppStyles.greyIconColor,
                                  )),
                      ),
                      title: translate('password'),
                      textInputType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      validator: (text) {
                        if (!(AppUtils.checkRequired(text))) {
                          return translate('required');
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: AppConstants.PADDING_60,
                  ),
                  Center(
                    child: AppCustomButton(
                      loaderColor: AppStyles.primary500Color,
                      width: 206,
                      height: 44,
                      background: AppStyles.primary500Color,
                      text: translate('login'),
                      textColor: AppStyles.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      onClicked: () {
                        Navigator.pushNamed(
                            context, AppScreens.home);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        )), /* add child content here */
      ),
    );
  }
}
