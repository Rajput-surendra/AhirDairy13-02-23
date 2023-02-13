import 'package:flutter/material.dart';
import 'package:milk/constants/constants.dart';

class CommonWhiteButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;

  CommonWhiteButton(
      {this.title, @required this.onPressed, this.padding, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.white.withOpacity(0.1)
                  : Colors.grey.shade100.withOpacity(0.7),
              blurRadius: 5,
              spreadRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
          color: isDark
              ? Colors.black.withOpacity(0.5)
              : AppThemes.lightWhiteBackGroundColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 29),
        ),
        padding: padding,
        child: Text(
          title ?? '',
          style: Theme.of(context).textTheme.headline5?.copyWith(
              fontSize: 16,
              color: isDark ? Colors.white : AppThemes.lightBlackColor),
        ),
      ),
    );
  }
}
