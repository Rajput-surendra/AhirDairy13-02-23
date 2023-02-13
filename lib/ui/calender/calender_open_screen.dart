import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:milk/constants/constants.dart';
import 'package:milk/ui/component/component.dart';
import 'package:milk/ui/product/product_detail.dart';

class CalenderOpenScreen extends StatefulWidget {
  @override
  _CalenderOpenScreenState createState() => _CalenderOpenScreenState();
}

class _CalenderOpenScreenState extends State<CalenderOpenScreen> {
  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark
          ? AppThemes.smoothBlack
          : AppThemes.lightTextFieldBackGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            CommonAppBar(
              title: "09 Feb 2021",
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: isDark
                        ? AppThemes.DarkModeColor.withOpacity(0.9)
                        : AppThemes.lightWhiteBackGroundColor.withOpacity(0.9),
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
                      return Slidable(
                        startActionPane: ActionPane(
                          motion: ScrollMotion(),
                          extentRatio: 0.20,
                          children: <Widget>[
                            // SlidableAction(
                            //   onPressed: (context) {},
                            //   flex: 1,
                            //   backgroundColor:
                            //       AppThemes.lightDeepOrangeAccentColor,
                            //   foregroundColor: Colors.white,
                            //   label: 'delete',
                            //   icon: Icons.save,
                            // )
                            Padding(
                              padding: const EdgeInsets.only(left: 21),
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: AppThemes.lightDeepOrangeAccentColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/images/delete.svg',
                                  )),
                            ),
                          ],
                        ),
                        child: Container(
                            margin: getFirstNLastMergin(index, 5),
                            decoration: BoxDecoration(
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
                            )),
                      );
                    },
                  ),
                ),
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 30),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      getTranslator("order_summary"),
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(fontWeight: FontWeight.w700, fontSize: 15),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 7),
                    child: Row(
                      children: [
                        Text(
                          getTranslator("price"),
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: AppThemes.lightTextGreyColor),
                          textAlign: TextAlign.left,
                        ),
                        Spacer(),
                        Text(
                          "₹ 210.00",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(
                                  fontWeight: FontWeight.w700, fontSize: 15),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 7, bottom: 7),
                    child: Row(
                      children: [
                        Text(
                          getTranslator("discount") + " 10%",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: AppThemes.lightTextGreyColor),
                          textAlign: TextAlign.left,
                        ),
                        Spacer(),
                        Text(
                          "- ₹ 21.00",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: AppThemes.lightRedColor),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 7, bottom: 7),
                    child: Row(
                      children: [
                        Text(
                          getTranslator("delivery"),
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: AppThemes.lightTextGreyColor),
                          textAlign: TextAlign.left,
                        ),
                        Spacer(),
                        Text(
                          "Free",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(
                                  fontWeight: FontWeight.w700, fontSize: 15),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 7, bottom: 7),
                    child: Row(
                      children: [
                        Text(
                          getTranslator("total_cost"),
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: AppThemes.lightTextGreyColor),
                          textAlign: TextAlign.left,
                        ),
                        Spacer(),
                        Text(
                          "₹ 189.00",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: AppThemes.lightGreenColor),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  getFirstNLastMergin(int index, int length) {
    if (index == 0) {
      return EdgeInsets.only(left: 15, right: 15, top: 20);
    } else if (index == length - 1) {
      return EdgeInsets.only(left: 15, right: 15, bottom: 20);
    }
    return EdgeInsets.only(left: 15, right: 15);
  }
}
