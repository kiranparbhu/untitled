import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_constants.dart';
import '../utils/app_styles.dart';

class AppTextField extends StatefulWidget {
  const AppTextField(
      {Key? key,
        this.title,
        this.height,
        this.suffixIcon,
        this.controller,
        this.hintText,
        this.hintStyle,
        this.prefixIcon,
        this.titleTextStyle,
        // this.cursorCenter,
        this.validator,
        this.textInputType = TextInputType.text,
        this.isForPin,
        this.onChanged,
        this.inputFormatters,
        this.maxLines,
        this.minLines,
        this.obscureText = false,
        this.textCapitalization = false,
        this.readOnly,
        this.inputTextStyle,
        this.onTap,
        this.focusNode,
        this.fillColor})
      : super(key: key);

  final String? title;
  final double? height;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? titleTextStyle;
  final Widget? prefixIcon;

  // final bool? cursorCenter;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final bool? isForPin;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? minLines;
  final bool textCapitalization;
  final bool? readOnly;
  final Color? fillColor;
  final TextStyle? inputTextStyle;
  final FocusNode? focusNode;
  final Function()? onTap;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // if (widget.title != null) ...[
        //   Container(
        //     margin: const EdgeInsets.only(left: 2),
        //     child: Text(widget.title ?? "", style: widget.titleTextStyle),
        //   ),
        //   const SizedBox(
        //     height: AppConstants.PADDING_8,
        //   ),
        // ],
        SizedBox(
          // height: widget.height ?? 50,
          child: TextFormField(
            onTap: widget.onTap,
            focusNode: widget.focusNode,
            obscureText: widget.obscureText,
            textAlignVertical: TextAlignVertical.center,
            controller: widget.controller,
            cursorColor: AppStyles.black,
            readOnly: widget.readOnly ?? false,
            style: widget.inputTextStyle ?? AppStyles.textInputStyle,
            textAlign: (widget.isForPin ?? false) ? TextAlign.center : TextAlign.start,
            decoration: InputDecoration(
              label: Text(widget.title ?? "", style: widget.titleTextStyle),
              errorStyle: const TextStyle(
                color: AppStyles.danger500Color,
                fontSize: 12,
                // height: 0.7,
              ),
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(AppConstants.textFieldRadius),
                ),
                borderSide: const BorderSide(color: AppStyles.primary500Color),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(AppConstants.textFieldRadius),
                ),
                borderSide: const BorderSide(color: AppStyles.primary500Color),
              ),
              prefix: Padding(
                padding: EdgeInsets.only(left: widget.prefixIcon == null ? 12 : 0.0),
              ),
              prefixIcon: widget.prefixIcon,
              // border: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: widget.hintStyle,
              suffixIcon: (widget.suffixIcon == null)
                  ? null
                  : Padding(
                padding: const EdgeInsets.all(13.0),
                child: widget.suffixIcon,
              ),
            ),
            keyboardType: widget.textInputType,
            validator: widget.validator,
            inputFormatters: widget.inputFormatters ?? [],
            // inputFormatters: widget.inputFormatters == null && widget.textInputType == TextInputType.number
            //     ? <TextInputFormatter>[FilteringTextInputFormatter.deny(RegExp(r'^0+')), FilteringTextInputFormatter.digitsOnly]
            //     : widget.inputFormatters ?? [],
            //  autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: widget.onChanged,
            maxLines: widget.maxLines ?? 1,
            minLines: widget.minLines ?? 1,
            textInputAction: TextInputAction.next,
            // textCapitalization: (widget.textCapitalization) ? TextCapitalization.characters : TextCapitalization.characters,
          ),
        ),
        // ),
      ],
    );
  }
}