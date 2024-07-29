import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jadwal_kuliah/ui/common/app_colors.dart';
import 'package:jadwal_kuliah/ui/common/app_texts.dart';

class CustomTextFieldOutline extends StatelessWidget {
  final TextEditingController? controller;
  final Function()? onTap;
  final FocusNode? focusNode;
  final bool enabled;
  final bool readOnly;
  final bool obscureText;
  final int minLines;
  final int maxLines;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextStyle? textStyle;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color color;
  final Color outlineColor;
  final Color outlineFocusedColor;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;
  final TextCapitalization? textCapitalization;

  const CustomTextFieldOutline({
    super.key,
    this.controller,
    this.onTap,
    this.focusNode,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.minLines = 1,
    this.maxLines = 1,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.textStyle,
    this.labelText,
    this.labelStyle,
    this.hintText,
    this.hintStyle,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.color = kcBackgroundColor,
    this.outlineColor = kcMediumGrey,
    this.outlineFocusedColor = kcPrimaryColor,
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.validator,
    this.textCapitalization,
  });

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: outlineColor,
      ),
      borderRadius: BorderRadius.circular(12),
    );

    return TextFormField(
      controller: controller,
      onTap: onTap,
      focusNode: focusNode,
      enabled: enabled,
      readOnly: readOnly,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      minLines: minLines,
      maxLines: maxLines,
      onChanged: onChanged,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
      autovalidateMode: autovalidateMode,
      validator: validator,
      style: textStyle ?? ktRegularTextStyle.copyWith(color: kcMediumGrey),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle:
            labelStyle ?? ktRegularTextStyle.copyWith(color: kcMediumGrey),
        fillColor: color,
        filled: true,
        enabledBorder: outlineInputBorder,
        disabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder.copyWith(
          borderSide: BorderSide(
            color: outlineFocusedColor,
            width: 1.5,
          ),
        ),
        errorBorder: outlineInputBorder.copyWith(
          borderSide: const BorderSide(
            color: kcDangerColor,
          ),
        ),
        focusedErrorBorder: outlineInputBorder.copyWith(
          borderSide: const BorderSide(
            color: kcDangerColor,
            width: 1.5,
          ),
        ),
        hintText: hintText,
        hintStyle: hintStyle,
        errorText: errorText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorMaxLines: 2,
      ),
    );
  }
}
