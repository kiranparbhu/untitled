import '../constants/app_constants.dart';
import '../utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppCustomButton extends StatelessWidget {
  const AppCustomButton({
    Key? key,
    required this.background,
    required this.text,
    this.endIcon,
    this.onClicked,
    this.textColor,
    this.fontWeight,
    this.fontSize,
    this.width,
    this.height,
    this.elevation,
    this.centerText = false,
    this.isLoading = false,
    required this.loaderColor,
  }) : super(key: key);

  final Color background;
  final String text;
  final Widget? endIcon;
  final Color? textColor;
  final Color? loaderColor;
  final double? fontSize;
  final double? width;
  final double? height;
  final FontWeight? fontWeight;
  final VoidCallback? onClicked;
  final double? elevation;
  final bool centerText;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
      decoration: const BoxDecoration(color: AppStyles.grey100Color,
          borderRadius: BorderRadius.all(Radius.circular(49))),
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
                color: loaderColor,
              ),
            ),
          ),
        ],
      ),
    )
        : SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onClicked,
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return AppStyles.blue900Color;
              }
              return textColor ?? AppStyles.white;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return AppStyles.primary500Color;
              }
              return background;
            },
          ),
          elevation: MaterialStateProperty.resolveWith<double?>(
                (Set<MaterialState> states) {
              return elevation ?? 0;
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(AppConstants.textFieldRadius),
                side: const BorderSide(color: Colors.transparent)),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: endIcon != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
          children: [
            if (centerText && endIcon != null) ...[
              const Spacer(),
              Opacity(
                opacity: 0.0,
                child: endIcon!,
              ),
            ],
            Text(
              text,
              softWrap: false,
              style: TextStyle(fontWeight: fontWeight ?? FontWeight.bold, fontSize: fontSize, color: textColor),
            ),
            if (endIcon != null) ...[
              const Spacer(),
              endIcon!,
            ],
          ],
        ),
      ),
    );
  }
}