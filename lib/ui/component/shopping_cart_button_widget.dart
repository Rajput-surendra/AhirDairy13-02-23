import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk/constants/app_themes.dart';
import 'package:milk/ui/product/checkout_screen.dart';

class ShoppingCartButtonWidget extends StatefulWidget {
  const ShoppingCartButtonWidget({
    this.iconColor,
    this.labelColor,
    Key? key,
  }) : super(key: key);

  final Color? iconColor;
  final Color? labelColor;

  @override
  _ShoppingCartButtonWidgetState createState() =>
      _ShoppingCartButtonWidgetState();
}

class _ShoppingCartButtonWidgetState extends State<ShoppingCartButtonWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(CheckoutScreen());
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: <Widget>[
                Icon(
                  Icons.shopping_cart,
                  color: this.widget.iconColor,
                  size: 28,
                ),
                Container(
                  child: Center(
                    child: Text(
                      "1",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption!.merge(
                            TextStyle(
                                color: AppThemes.lightWhiteColor, fontSize: 8),
                          ),
                    ),
                  ),
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      color: this.widget.labelColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  constraints: BoxConstraints(
                      minWidth: 15, maxWidth: 15, minHeight: 15, maxHeight: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
