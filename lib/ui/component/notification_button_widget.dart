import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk/ui/my_history/my_history.dart';

class NotificationButtonWidget extends StatefulWidget {
  const NotificationButtonWidget({
    required this.iconColor,
    required this.labelColor,
    this.scaffoldKey,
    Key? key,
  }) : super(key: key);
  final GlobalKey<ScaffoldState>? scaffoldKey;

  final Color iconColor;
  final Color labelColor;

  @override
  _NotificationButtonWidgetState createState() =>
      _NotificationButtonWidgetState();
}

class _NotificationButtonWidgetState extends State<NotificationButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(PaymentHistory(
          isNotified: true,
        ));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: <Widget>[
                Transform.rotate(
                  angle: -45 * pi / 180,
                  child: Icon(
                    Icons.notifications,
                    color: this.widget.iconColor,
                    size: 28,
                  ),
                ),
                ClipOval(
                  child: Container(
                    height: 8,
                    width: 8,
                    color: this.widget.labelColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
