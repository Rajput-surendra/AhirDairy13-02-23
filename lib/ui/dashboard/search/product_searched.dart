import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk/constants/constants.dart';
import 'package:milk/ui/component/component.dart';
import 'package:milk/ui/product/product.dart';

class ProductSearchedScreen extends StatefulWidget {
  @override
  _ProductSearchedScreenState createState() => _ProductSearchedScreenState();
}

class _ProductSearchedScreenState extends State<ProductSearchedScreen> {
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
                  Text(
                    getTranslator("product_searched") + " |",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: isDark
                            ? AppThemes.lightGreyColor
                            : AppThemes.lightBlackColor.withOpacity(0.5),
                        fontSize: 17),
                  ),
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
                        : AppThemes.lightWhiteColor,
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
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
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
    );
  }

  getFirstNLastMergin(int index, int length) {
    if (index == 0) {
      return EdgeInsets.only(left: 20, right: 20, top: 15);
    } else if (index == length - 1) {
      return EdgeInsets.only(left: 20, right: 20, bottom: 15);
    }
    return EdgeInsets.only(left: 20, right: 20);
  }
}
