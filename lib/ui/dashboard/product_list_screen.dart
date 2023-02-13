import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk/constants/constants.dart';
import 'package:milk/ui/component/component.dart';
import 'package:milk/ui/product/product_detail.dart';

import 'search/seach_for_product.dart';

class ProductListScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> parentScaffoldKey;
  final Function(int) callback;

  const ProductListScreen(
      {Key? key, required this.parentScaffoldKey, required this.callback})
      : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return WillPopScope(
      onWillPop: () async {
        widget.callback.call(0);
        return false;
      },
      child: Scaffold(
        backgroundColor:
            isDark ? Colors.black : AppThemes.lightTextFieldBackGroundColor,
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.sort, color: Theme.of(context).hintColor),
            onPressed: () =>
                widget.parentScaffoldKey.currentState!.openDrawer(),
          ),
          automaticallyImplyLeading: false,
          backgroundColor:
              isDark ? Colors.black : AppThemes.lightTextFieldBackGroundColor,
          elevation: 0,
          title: InkWell(
            onTap: () {
              Get.to(SearchForProduct());
            },
            child: IgnorePointer(
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: commonFloatingFormField(context, '',
                          hintText: getTranslator('search'),
                          fieldHeight: 40,
                          color: isDark
                              ? AppThemes.smoothBlack
                              : AppThemes.lightWhiteBackGroundColor,
                          contentPadding: EdgeInsets.only(bottom: 10),
                          floatingHint: FloatingLabelBehavior.always,
                          padding:
                              EdgeInsets.only(left: 0, bottom: 0, right: 10),
                          prefixIcon: Icon(Icons.search,
                              size: 28, color: AppThemes.lightTextGreyColor)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            ShoppingCartButtonWidget(
                iconColor: isDark
                    ? AppThemes.lightGreyColor
                    : AppThemes.lightBlackColor,
                labelColor: AppThemes.lightDeepOrangeAccentColor),
            NotificationButtonWidget(
                iconColor: isDark
                    ? AppThemes.lightGreyColor
                    : AppThemes.lightBlackColor,
                labelColor: AppThemes.lightDeepOrangeAccentColor),
            SizedBox(width: 15)
          ],
        ),
        body: SafeArea(
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
                      height: 15,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 10);
                        },
                        itemBuilder: (context, index) {
                          return Container(
                            margin: getFirstNLastMergin(index, 5),
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                                color: (index + 1) % 2 == 0
                                    ? AppThemes.lightRedColor
                                    : AppThemes.lightYellowColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 55,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 30);
                        },
                        itemBuilder: (context, index) {
                          return Container(
                            margin: getFirstNLastMergin(index, 5),
                            child: Center(
                              child: Text(
                                "Vegetables",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: index == 1
                                            ? AppThemes
                                                .lightButtonBackGroundColor
                                            : isDark
                                                ? AppThemes.lightWhiteColor
                                                : AppThemes.lightBlackColor,
                                        fontSize: 13),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          height: 210,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppThemes.lightButtonBackGroundColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        Positioned(
                          right: 40,
                          bottom: 0,
                          child: Column(
                            children: [
                              Text(
                                "Discount 30%",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 21,
                                        color: isDark
                                            ? AppThemes.lightBlackColor
                                            : AppThemes.lightWhiteColor),
                              ),
                              SizedBox(height: 30),
                              InkWell(
                                  onTap: () {},
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    child: Container(
                                      color: isDark
                                          ? AppThemes.smoothBlack
                                          : AppThemes.lightWhiteColor,
                                      padding: EdgeInsets.only(
                                          left: 30,
                                          right: 30,
                                          top: 18,
                                          bottom: 18),
                                      child: Center(
                                        child: Text(
                                          getTranslator("add_to_cart"),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(height: 30),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        children: [
                          getSaleProductTile(
                              categoryName: "Categories",
                              productName: "Product Name",
                              price: "₹ 40.00",
                              finalPrice: "₹ 40.00"),
                          Spacer(),
                          getSaleProductTile(
                              categoryName: "Categories",
                              productName: "Product Name",
                              price: "₹ 40.00",
                              finalPrice: "₹ 40.00"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 16, bottom: 16, left: 16, right: 16),
                      margin: EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppThemes.smoothBlack
                            : AppThemes.lightGreyBackGroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, bottom: 25),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              getTranslator("dairy_goodness"),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 21),
                            ),
                          ),
                          Row(
                            children: [
                              getProductComboOfferTile(
                                  productName: "Product Name",
                                  size: "1 Liter",
                                  price: "₹ 20.00",
                                  finalPrice: "₹ 15.00"),
                              SizedBox(width: 6),
                              Icon(Icons.add),
                              SizedBox(width: 6),
                              getProductComboOfferTile(
                                  productName: "Product Name",
                                  size: "1 Liter",
                                  price: "₹ 20.00",
                                  finalPrice: "₹ 15.00")
                            ],
                          ),
                          SizedBox(height: 23),
                          Row(
                            children: [
                              AutoSizeText(
                                "₹ 50.00",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: AppThemes.lightGreyColor,
                                        decoration: TextDecoration.lineThrough),
                                maxLines: 1,
                              ),
                              SizedBox(width: 10),
                              AutoSizeText(
                                "₹ 30.00",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                maxLines: 1,
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: isDark
                                            ? AppThemes.smoothBlack
                                                .withOpacity(0.6)
                                            : AppThemes.lightWhiteColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(
                                            color: AppThemes
                                                .lightButtonBackGroundColor,
                                            width: 1)),
                                    child: Icon(
                                        Icons.add_shopping_cart_outlined,
                                        color: AppThemes
                                            .lightButtonBackGroundColor)),
                              ),
                              SizedBox(width: 15),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        getTranslator("dairy_goodness"),
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 22),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 340,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 15);
                        },
                        itemBuilder: (context, index) {
                          return Container(
                            margin: getFirstNLastMergin(index, 5),
                            child: getSaleProductBigTile(
                                categoryName: "Categories",
                                productName: "Product Name",
                                finalPrice: "₹ 40.00"),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                      child: SearchProductListTile(
                        image: AllImages.tofu,
                        name: "Tofu",
                        weight: "0.5 KG",
                        displayPrice: "₹ 50.00",
                        actualPrice: "₹ 35.00",
                        onTileTap: () {
                          Get.to(ProductDetailScreen());
                        },
                        onCartTap: () {},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
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
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
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

  getSaleProductTile(
      {String? categoryName,
      String? productName,
      String? price,
      String? finalPrice}) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        Get.to(ProductDetailScreen());
      },
      child: Column(
        children: [
          Container(
            width: (MediaQuery.of(context).size.width / 2) - 22,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: isDark
                  ? AppThemes.DarkModeColor.withOpacity(0.9)
                  : AppThemes.lightWhiteColor,
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? Colors.grey.withOpacity(0.2)
                      : Colors.grey.shade100.withOpacity(0.7),
                  blurRadius: 5,
                  spreadRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Stack(
                    children: [
                      Container(
                          height: 132,
                          width: (MediaQuery.of(context).size.width / 2) - 22,
                          color: isDark
                              ? AppThemes.smoothBlack.withOpacity(0.7)
                              : AppThemes.lightTextFieldBackGroundColor),
                      Positioned(
                          top: 16,
                          left: 16,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            child: Container(
                              color: AppThemes.lightRedColor.withOpacity(0.2),
                              padding: EdgeInsets.only(
                                  left: 8.5, right: 8.5, top: 5, bottom: 5),
                              child: Text(
                                "SALE",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: AppThemes.lightRedColor),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    categoryName ?? '',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: AppThemes.lightGreyColor),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 6),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    productName ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 15),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          price ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: AppThemes.lightGreyColor,
                                  decoration: TextDecoration.lineThrough),
                          maxLines: 1,
                        ),
                      ),
                      Expanded(
                        child: AutoSizeText(
                          finalPrice ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 13),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  getProductComboOfferTile(
      {required String size,
      required String productName,
      required String price,
      required String finalPrice}) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        Get.to(ProductDetailScreen());
      },
      child: Column(
        children: [
          Container(
            width: (MediaQuery.of(context).size.width / 2) - 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: isDark
                  ? Colors.black.withOpacity(0.5)
                  : AppThemes.lightWhiteColor,
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Container(
                      height: 100,
                      width: (MediaQuery.of(context).size.width / 2) - 55,
                      color: isDark
                          ? AppThemes.DarkModeColor
                          : AppThemes.lightWhiteColor),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    productName,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 6),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    size,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.w300, fontSize: 13),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 15),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          price,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: AppThemes.lightGreyColor,
                                  decoration: TextDecoration.lineThrough),
                          maxLines: 1,
                        ),
                      ),
                      Expanded(
                        child: AutoSizeText(
                          finalPrice,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppThemes.lightButtonBackGroundColor,
                                  fontSize: 13),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  getSaleProductBigTile(
      {String? categoryName, String? productName, String? finalPrice}) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        Get.to(ProductDetailScreen());
      },
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: isDark
                  ? AppThemes.DarkModeColor.withOpacity(0.8)
                  : AppThemes.lightWhiteColor,
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? Colors.white.withOpacity(0.05)
                      : Colors.grey.shade100.withOpacity(0.7),
                  blurRadius: 5,
                  spreadRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Stack(
                    children: [
                      Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width * 0.75,
                          color: isDark
                              ? AppThemes.smoothBlack.withOpacity(0.8)
                              : AppThemes.lightTextFieldBackGroundColor),
                      Positioned(
                          top: 16,
                          left: 16,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            child: Container(
                              color: AppThemes.lightRedColor.withOpacity(0.2),
                              padding: EdgeInsets.only(
                                  left: 8.5, right: 8.5, top: 5, bottom: 5),
                              child: Text(
                                "SALE",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: AppThemes.lightRedColor),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            categoryName ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: AppThemes.lightGreyColor),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            child: Container(
                                padding: EdgeInsets.all(8),
                                color: isDark
                                    ? AppThemes.smoothBlack.withOpacity(0.8)
                                    : AppThemes.lightTextFieldBackGroundColor,
                                child: Icon(Icons.add_shopping_cart_outlined,
                                    color:
                                        AppThemes.lightButtonBackGroundColor))),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 6),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    productName ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 15),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          finalPrice ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 13),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
