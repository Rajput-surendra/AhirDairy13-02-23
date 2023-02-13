import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk/constants/constants.dart';
import 'package:milk/ui/component/search_product_list_tile.dart';
import 'package:milk/ui/product/product_detail.dart';

import '../../component/common_text_form_field.dart';
import '../dashboard.dart';

class SearchForProduct extends StatefulWidget {
  @override
  _SearchForProductState createState() => _SearchForProductState();
}

class _SearchForProductState extends State<SearchForProduct> {
  final TextEditingController controller = TextEditingController();
  List list = [
    'in Fresh Milk',
    'in Fresh Tetra pack',
    'in Fresh Milk',
    'in Fresh Milk',
    'in Fresh Milk'
  ];
  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor:
          isDark ? Colors.black : Color.fromARGB(255, 236, 194, 194),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    height: 60,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    color: isDark
                        ? Colors.black
                        : AppThemes.lightTextFieldBackGroundColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(Icons.close),
                        ),
                        Expanded(
                          child: commonFloatingFormField(
                            context,
                            '',
                            floatingHint: FloatingLabelBehavior.always,
                            controller: controller,
                            hintText: getTranslator('search_for_your_product'),
                            fieldHeight: 40,
                            color: Colors.transparent,
                            onChanged: (value) {
                              setState(() {});
                            },
                            contentPadding:
                                EdgeInsets.only(bottom: 10, left: 5),
                            padding:
                                EdgeInsets.only(left: 25, right: 10, bottom: 8),
                          ),
                        ),
                        // Text(
                        //   "| " + getTranslator("search_for_your_product"),
                        //   style: Theme.of(context).textTheme.headline5.copyWith(
                        //       fontWeight: FontWeight.w400,
                        //       color: isDark
                        //           ? AppThemes.lightGreyColor
                        //           : AppThemes.lightBlackColor.withOpacity(0.5),
                        //       fontSize: 17),
                        // ),
                        InkWell(
                          onTap: () {
                            Get.to(ProductSearchedScreen());
                          },
                          child: Icon(Icons.arrow_forward),
                        )
                      ],
                    ),
                  ),
                  controller.text.length < 1
                      ? Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: isDark
                                    ? AppThemes.DarkModeColor
                                    : AppThemes.lightWhiteColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))),
                            child: SingleChildScrollView(
                              child: Container(
                                constraints: BoxConstraints(
                                    minHeight:
                                        MediaQuery.of(context).size.height -
                                            60),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.09,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: Text(
                                        getTranslator("popular_suggestions"),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                                fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: Wrap(
                                        spacing:
                                            8.0, // gap between adjacent chips
                                        runSpacing: 10.0, // gap between lines
                                        children: <Widget>[
                                          getTagWidget(
                                              getTranslator("category")),
                                          getTagWidget(
                                              getTranslator("category")),
                                          getTagWidget(
                                              getTranslator("category")),
                                          getTagWidget(
                                              getTranslator("category")),
                                          getTagWidget("    " +
                                              getTranslator("category") +
                                              "    "),
                                          getTagWidget(
                                              getTranslator("category")),
                                          getTagWidget(
                                              getTranslator("category")),
                                          getTagWidget("  " +
                                              getTranslator("category") +
                                              "  "),
                                          getTagWidget(
                                              getTranslator("category")),
                                          getTagWidget(
                                              getTranslator("category")),
                                          getTagWidget(
                                              getTranslator("category")),
                                          getTagWidget("    " +
                                              getTranslator("category") +
                                              "    "),
                                          getTagWidget(
                                              getTranslator("category")),
                                          getTagWidget(
                                              getTranslator("category")),
                                          getTagWidget(
                                              getTranslator("category")),
                                          getTagWidget(
                                              getTranslator("category")),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: isDark
                                    ? AppThemes.DarkModeColor
                                    : AppThemes.lightWhiteColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))),
                            child: Container(
                              constraints: BoxConstraints(
                                  minHeight:
                                      MediaQuery.of(context).size.height - 60),
                              child: ListView.separated(
                                itemCount: 5,
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 20);
                                },
                                itemBuilder: (context, index) {
                                  return Container(
                                      margin: getFirstNLastMergin(index, 5),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: SearchProductListTile(
                                        image: AllImages.tofu,
                                        name: "Tofu",
                                        weight: "0.5 KG",
                                        displayPrice: "₹ 50.00",
                                        actualPrice: "₹ 35.00",
                                        onTileTap: () {
                                          Get.to(ProductDetailScreen());
                                        },
                                        onCartTap: () {
                                          print("ON Tap card");
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
            controller.text.length < 1
                ? SizedBox()
                : Positioned(
                    top: 60,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: isDark
                          ? AppThemes.DarkModeColor
                          : AppThemes.lightWhiteColor,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 8),
                      child: ListView.builder(
                        itemCount: list.length,
                        shrinkWrap: true,
                        itemExtent: 40,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            color: isDark
                                ? Theme.of(context)
                                    .dialogBackgroundColor
                                    .withOpacity(0.3)
                                : AppThemes.lightGreyColor.withOpacity(0.1),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 4.0),
                            child: RichText(
                              text: TextSpan(
                                text: 'Milk ',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  color: isDark ? Colors.white : Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'in Fresh Milk',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: AppThemes.lightGreyColor),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ))
          ],
        ),
      ),
    );
  }

  getTagWidget(String title) {
    return FittedBox(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: AppThemes.lightButtonBackGroundColor)),
        child: Center(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: AppThemes.lightButtonBackGroundColor, fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
