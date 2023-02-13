import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk/constants/constants.dart';
import 'package:milk/controllers/my_wallet_controller.dart';
import 'package:milk/ui/component/component.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import 'credit_card_payment.dart';

class MyWalletScreen extends StatefulWidget {
  @override
  _MyWalletScreenState createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends StateMVC<MyWalletScreen> {
  late MyWalletController con;

  _MyWalletScreenState() : super(MyWalletController()) {
    con = controller as MyWalletController;
  }

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor:
          isDark ? Colors.black : AppThemes.lightTextFieldBackGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 60,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "₹ 250.00",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                      Text(
                        getTranslator("your_balance"),
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                      SizedBox(
                        height: 8,
                      )
                    ],
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back),
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
                child: SingleChildScrollView(
                  child: Container(
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height - 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            getTranslator("top_up_your_account"),
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                        ),
                        SizedBox(height: 12),
                        Container(
                          height: 40,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 10);
                            },
                            itemBuilder: (context, index) {
                              bool isSelected = index == 0;

                              return Container(
                                margin: getFirstNLastMergin(index, 5),
                                decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppThemes.lightButtonBackGroundColor
                                        : Colors.transparent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    border: Border.all(
                                        color: AppThemes
                                            .lightButtonBackGroundColor)),
                                child: Center(
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Text(
                                      "₹ 250.00",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(
                                            color: isSelected
                                                ? AppThemes.lightWhiteColor
                                                : AppThemes
                                                    .lightButtonBackGroundColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            getTranslator("payment_with"),
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                        ),
                        SizedBox(height: 12),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              color: isDark
                                  ? AppThemes.smoothBlack
                                  : AppThemes.lightGreyBackGroundColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                  color: AppThemes.lightGreyBackGroundColor)),
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 12, right: 12, top: 20, bottom: 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      getTranslator("credit_card"),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(width: 8),
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: Container(
                                        color: isDark
                                            ? Colors.white.withOpacity(0.8)
                                            : AppThemes
                                                .lightWhiteBackGroundColor,
                                        height: 20,
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 2,
                                            bottom: 2),
                                        child: Image.asset(
                                          AllImages.mastercard_icon,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: Container(
                                        color: isDark
                                            ? Colors.white.withOpacity(0.8)
                                            : AppThemes
                                                .lightWhiteBackGroundColor,
                                        height: 20,
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 2,
                                            bottom: 2),
                                        child: Image.asset(
                                            AllImages.visa_card_logo),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    getTranslator("credit_card_info"),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(fontSize: 13, height: 1.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                  color: AppThemes.lightGreyBackGroundColor)),
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 12, right: 12, top: 20, bottom: 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      getTranslator("paypal"),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(width: 8),
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: Container(
                                        color: isDark
                                            ? Colors.white.withOpacity(0.8)
                                            : AppThemes
                                                .lightGreyBackGroundColor,
                                        height: 20,
                                        padding: EdgeInsets.only(
                                            left: 15,
                                            right: 15,
                                            top: 3,
                                            bottom: 3),
                                        child:
                                            Image.asset(AllImages.paypal_icon),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    getTranslator("paypal_info"),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(fontSize: 13, height: 1.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        CommonRaisedButton(
                          title: getTranslator("add_balance"),
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.10,
                              vertical: 18),
                          onPressed: () {
                            Get.to(CreditCardPayment());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getFirstNLastMergin(int index, int length) {
    if (index == 0) {
      return EdgeInsets.only(left: 15);
    } else if (index == length - 1) {
      return EdgeInsets.only(right: 15);
    }
    return null;
  }
}
