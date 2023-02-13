import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk/constants/constants.dart';
import 'package:milk/ui/component/component.dart';
import 'package:milk/ui/payment/payment.dart';

import 'product_detail.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor:
          isDark ? Colors.black : AppThemes.lightTextFieldBackGroundColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SafeArea(
            child: Column(
              children: [
                Container(
                  height: 60,
                  padding: EdgeInsets.only(left: 25, right: 25),
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getTranslator("checkout"),
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 0.5,
                                    fontSize: 20),
                          ),
                          Text(
                            getTranslator("total") + " ₹ 70.00",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                          SizedBox(
                            height: 6,
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(Icons.arrow_back),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: isDark
                            ? AppThemes.DarkModeColor
                            : AppThemes.lightWhiteBackGroundColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    child: Container(
                      constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height - 60),
                      child: ListView.separated(
                        itemCount: 5,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 20);
                        },
                        itemBuilder: (context, index) {
                          return Container(
                              margin: getFirstNLastMergin(index, 5),
                              padding: EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                  color: isDark
                                      ? Colors.black.withOpacity(.3)
                                      : AppThemes.lightWhiteBackGroundColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: CheckOutProductListTile(
                                image: AllImages.tofu,
                                name: "Tofu",
                                weight: "0.5 KG",
                                displayPrice: "₹ 50.00",
                                actualPrice: "₹ 35.00",
                                onTileTap: () {
                                  Get.to(ProductDetailScreen());
                                },
                              ));
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 12),
            child: CommonRaisedButton(
              title: getTranslator("proceed_to_confirm"),
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.07,
                  vertical: 18),
              onPressed: () {
                Get.to(AddMoneyScreen());
              },
            ),
          )
        ],
      ),
    );
  }

  getFirstNLastMergin(int index, int length) {
    if (index == 0) {
      return EdgeInsets.only(left: 15, right: 15, top: 20);
    } else if (index == length - 1) {
      return EdgeInsets.only(left: 15, right: 15, bottom: 75);
    }
    return EdgeInsets.only(left: 15, right: 15);
  }
}
