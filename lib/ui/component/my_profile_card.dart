import 'package:flutter/material.dart';
import 'package:milk/constants/constants.dart';

class ProfileItemCard extends StatelessWidget {
  final String? headline;
  final String? title;
  final Widget? leadingWidget;
  final Widget? trailingWidget;

  ProfileItemCard(
      {this.headline, this.title, this.leadingWidget, this.trailingWidget});

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.only(left: 25, right: 15, top: 15, bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: isDark
                  ? AppThemes.smoothBlack.withOpacity(0.2)
                  : AppThemes.lightGreyBackGroundColor.withOpacity(0.2),
              blurRadius: 7.0,
              offset: Offset(0.0, 6))
        ],
      ),
      child: Row(
        children: [
          leadingWidget ?? SizedBox(),
          Expanded(
              child: Container(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(headline ?? '',
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: isDark
                                  ? AppThemes.lightBlackColor
                                  : AppThemes.lightBlackColor,
                            )),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      title ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ],
          ))),
          trailingWidget ?? SizedBox()
        ],
      ),
    );
  }
}
