import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk/constants/constants.dart';
import 'package:milk/ui/component/component.dart';
import 'package:milk/ui/my_wallet/my_wallet.dart';

class AddMoneyScreen extends StatefulWidget {
  @override
  _AddMoneyScreenState createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends State<AddMoneyScreen> {
  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor:
          isDark ? Colors.black : AppThemes.lightTextFieldBackGroundColor,
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              color: isDark ? Colors.black : AppThemes.lightGreyBackGroundColor,
              height: MediaQuery.of(context).size.height / 1.3,
            ),
            Positioned(
              right: 25,
              top: MediaQuery.of(context).size.height * 0.3,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: ClipOval(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppThemes.lightButtonBackGroundColor,
                    ),
                    child: Icon(
                      Icons.close,
                      color: AppThemes.lightWhiteColor,
                    ),
                  ),
                ),
              ),
            ),
            DraggableScrollableSheet(
              maxChildSize: 1,
              initialChildSize: .60,
              minChildSize: .60,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                      color: isDark ? AppThemes.DarkModeColor : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(26),
                        topRight: Radius.circular(26),
                      )),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: isDark
                                  ? AppThemes.DarkModeColor
                                  : AppThemes.lightWhiteColor,
                              borderRadius: BorderRadius.circular(26)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  getTranslator("quick_terms"),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: AppThemes.lightTextGreyColor,
                                        fontSize: 13,
                                      ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.03),
                              Row(
                                children: [
                                  Image.asset(
                                    AllImages.logistic_truck,
                                    width: 34,
                                    color: isDark
                                        ? AppThemes
                                            .lightTextFieldBackGroundColor
                                        : null,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    getTranslator("enjoy_delivery"),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                  )
                                ],
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.03),
                              Text(
                                getTranslator("add_promo_code"),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              Row(
                                children: [
                                  Expanded(
                                      child: commonFloatingFormField(
                                          context, '',
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 2),
                                          contentPadding:
                                              EdgeInsets.only(bottom: 12),
                                          hintText:
                                              getTranslator("code_here"))),
                                  SizedBox(width: 15),
                                  InkWell(
                                    onTap: () {
//                                      Get.back();
                                    },
                                    child: ClipOval(
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: AppThemes
                                              .lightButtonBackGroundColor,
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          color: AppThemes.lightWhiteColor,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.06),
                              Center(
                                child: CommonRaisedButton(
                                  title: getTranslator("add_money_now"),
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.10,
                                      vertical: 18),
                                  onPressed: () {
                                    Get.to(MyWalletScreen());
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
