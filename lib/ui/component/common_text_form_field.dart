import 'package:flutter/material.dart';
import 'package:milk/constants/app_themes.dart';

Widget commonFloatingFormField(BuildContext _context, String title,
    {FormFieldSetter<String>? onSaved,
    TextEditingController? controller,
    Color? color,
    VoidCallback? callback,
    FormFieldValidator<String>? validator,
    bool? isObscureText,
    double? fieldHeight,
    int? maxLines,
    TextInputType? keyboardType,
    int? maxLength,
    EdgeInsetsGeometry? contentPadding,
    String? hintText,
    Widget? prefixIcon,
    FloatingLabelBehavior? floatingHint,
    ValueChanged? onChanged,
    EdgeInsetsGeometry? padding,
    bool? readonly,
    Widget? suffixIcon}) {
  return Container(
    // height: fieldHeight ?? 50,
    decoration: BoxDecoration(
      color: color ?? Theme.of(_context).inputDecorationTheme.fillColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Center(
        child: TextFormField(
          //controller: controller,
          textAlignVertical: TextAlignVertical.center,
          style: Theme.of(_context).textTheme.headline3?.copyWith(
                fontSize: 16,
                color: AppThemes.lightGreyColor,
              ),
          keyboardType: keyboardType,
          maxLength: maxLength,
          readOnly: readonly ?? false,
          decoration: InputDecoration(
             counterText: "",
              contentPadding: contentPadding ?? EdgeInsets.only(bottom: 10),
              border: InputBorder.none,
              labelText: title,
              labelStyle: Theme.of(_context).textTheme.headline5?.copyWith(
                  fontSize: 13,
                  color: AppThemes.lightGreyColor,
                  fontWeight: FontWeight.w500),
              hintText: hintText,
              floatingLabelBehavior:
                  floatingHint ?? FloatingLabelBehavior.always,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon),
          validator: validator,
          onSaved: onSaved,
          onChanged: onChanged ?? (value) {},
          onTap: callback,
          obscureText: isObscureText ?? false,
          maxLines: maxLines ?? 1,
        ),
      ),
    ),
  );
}
