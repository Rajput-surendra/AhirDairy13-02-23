import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk/constants/constants.dart';
import 'package:milk/ui/component/component.dart';

import 'my_wallet.dart';

class CreditCardPayment extends StatefulWidget {
  @override
  _CreditCardPaymentState createState() => _CreditCardPaymentState();
}

class _CreditCardPaymentState extends State<CreditCardPayment> {
  final formKey = GlobalKey<FormState>();
  bool switchControl = false;

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
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: CreditCardTile(
                            name: "Card Name",
                            number: "4756",
                            price: "₹ 250.00",
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: commonFloatingFormField(
                                    context, getTranslator("card_name"),
                                    floatingHint: FloatingLabelBehavior.auto,
                                    onSaved: (value) {}, validator: (value) {
                                  if (value!.isEmpty) {
                                    return getTranslator('this_field_required');
                                  }
                                  return null;
                                }),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: commonFloatingFormField(
                                    context, getTranslator("card_number"),
                                    keyboardType: TextInputType.number,
                                    floatingHint: FloatingLabelBehavior.auto,
                                    onSaved: (value) {}, validator: (value) {
                                  if (value!.isEmpty) {
                                    return getTranslator('this_field_required');
                                  }
                                  return null;
                                }),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: commonFloatingFormField(
                                          context, getTranslator("mm"),
                                          floatingHint:
                                              FloatingLabelBehavior.auto,
                                          keyboardType: TextInputType.number,
                                          onSaved: (value) {},
                                          validator: (value) {
                                        if (value!.isEmpty) {
                                          return getTranslator(
                                              'this_field_required');
                                        }
                                        return null;
                                      }),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: commonFloatingFormField(
                                          context, getTranslator("yy"),
                                          floatingHint:
                                              FloatingLabelBehavior.auto,
                                          keyboardType: TextInputType.number,
                                          onSaved: (value) {},
                                          validator: (value) {
                                        if (value!.isEmpty) {
                                          return getTranslator(
                                              'this_field_required');
                                        }
                                        return null;
                                      }),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: commonFloatingFormField(
                                          context, getTranslator("ccv"),
                                          keyboardType: TextInputType.number,
                                          floatingHint:
                                              FloatingLabelBehavior.auto,
                                          onSaved: (value) {},
                                          validator: (value) {
                                        if (value!.isEmpty) {
                                          return getTranslator(
                                              'this_field_required');
                                        }
                                        return null;
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            children: [
                              Transform.scale(
                                  scale: 1.5,
                                  child: Switch(
                                    onChanged: toggleSwitch,
                                    value: switchControl,
                                    activeColor:
                                        AppThemes.lightButtonBackGroundColor,
                                    activeTrackColor: isDark
                                        ? AppThemes.smoothBlack
                                        : AppThemes.lightGreyBackGroundColor,
                                    inactiveThumbColor: isDark
                                        ? AppThemes.smoothBlack.withOpacity(0.1)
                                        : AppThemes.lightWhiteColor,
                                    inactiveTrackColor: isDark
                                        ? AppThemes.smoothBlack
                                        : AppThemes.lightGreyBackGroundColor,
                                  )),
                              SizedBox(width: 10),
                              Text(
                                getTranslator("save_card_as_default"),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        CommonRaisedButton(
                          title: "Add ₹ 250.00 to Balance",
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.10,
                              vertical: 18),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Get.to(PurchaseSuccess());
                            }
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

  void toggleSwitch(bool value) {
    if (switchControl == false) {
      setState(() {
        switchControl = true;
      });
    } else {
      setState(() {
        switchControl = false;
      });
    }
  }
}
