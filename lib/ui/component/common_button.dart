import 'package:flutter/material.dart';
import 'package:milk/constants/constants.dart';

class CommonRaisedButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;

  CommonRaisedButton(
      {required this.title,
      @required this.onPressed,
      this.padding,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: AppThemes.lightButtonBackGroundColor,
        padding: padding,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 29)),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline5?.copyWith(
            fontSize: 15,
            color: AppThemes.lightWhiteColor,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
