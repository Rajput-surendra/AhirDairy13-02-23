import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk/constants/constants.dart';
import 'package:milk/model/model.dart';
import 'package:milk/ui/component/component.dart';
import 'package:milk/ui/component/read_more_text.dart';
import 'package:milk/ui/product/product.dart';
import 'package:milk/ui/vacations/add_vacation.dart';

class ProductDetailScreen extends StatefulWidget {
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  List<String> listTag = ["Daily", "Weekly", "Select Days"];
  List<SelectDayItem> listSelectDayItem = [
    SelectDayItem(title: "Sun", isSelected: true),
    SelectDayItem(title: "Mon", isSelected: true),
    SelectDayItem(title: "Tue", isSelected: true),
    SelectDayItem(title: "Wed"),
    SelectDayItem(title: "Thu"),
    SelectDayItem(title: "Fri"),
    SelectDayItem(title: "Sat"),
  ];
  int selectedIndex = 0;
  int count = 1;

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? Colors.black : AppThemes.lightTextFieldBackGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            CommonAppBar(title: getTranslator("edit_plan")),
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
                        Container(
                          margin: EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 20),
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              child: Image.asset(
                                AllImages.tofu,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              )),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 20, right: 20, bottom: 20),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Tofu",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "0.5 KG",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          "₹ 50.00",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  color: AppThemes
                                                      .lightTextGreyColor,
                                                  fontSize: 13,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "₹ 35.00",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppThemes
                                                      .lightButtonBackGroundColor,
                                                  fontSize: 13),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )),
                              InkWell(
                                onTap: () {
                                  if (count >= 1) {
                                    count -= 1;
                                    setState(() {});
                                  }
                                },
                                child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                    child: Container(
                                        padding: EdgeInsets.all(6),
                                        color: isDark
                                            ? AppThemes.smoothBlack
                                            : AppThemes
                                                .lightTextFieldBackGroundColor,
                                        child: Icon(Icons.remove,
                                            color: AppThemes.lightRedColor,
                                            size: 20))),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  count.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  count += 1;
                                  setState(() {});
                                },
                                child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                    child: Container(
                                        padding: EdgeInsets.all(6),
                                        color: isDark
                                            ? AppThemes.smoothBlack
                                            : AppThemes
                                                .lightTextFieldBackGroundColor,
                                        child: Icon(Icons.add,
                                            color: AppThemes
                                                .lightButtonBackGroundColor,
                                            size: 20))),
                              ),
                              /*InkWell(
                                onTap: () {},
                                child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    child: Container(
                                        padding: EdgeInsets.all(8),
                                        color: AppThemes
                                            .lightTextFieldBackGroundColor,
                                        child: Row(
                                          children: [
                                            Text(
                                              "Add",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5
                                                  !.copyWith(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppThemes
                                                          .lightButtonBackGroundColor,
                                                      fontSize: 13),
                                            ),
                                            SizedBox(width: 8),
                                            Icon(
                                                Icons
                                                    .add_shopping_cart_outlined,
                                                color: AppThemes
                                                    .lightButtonBackGroundColor),
                                          ],
                                        ))),
                              )*/
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          alignment: Alignment.centerLeft,
                          child: ReadMoreText(
                            'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups. Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
                            trimLines: 3,
                            colorClickableText: AppThemes.lightBlueColor,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: '...More',
                            trimExpandedText: ' Less',
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            getTranslator("get_frequently"),
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        SizedBox(height: 12),
                        Container(
                          height: 35,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: listTag.length,
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 10);
                            },
                            itemBuilder: (context, index) {
                              bool isSelected = index == selectedIndex;

                              String tagName = listTag[index];
                              return Container(
                                margin:
                                    getFirstNLastMergin(index, listTag.length),
                                decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppThemes.lightButtonBackGroundColor
                                        : Colors.transparent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    border: Border.all(
                                        color: AppThemes
                                            .lightButtonBackGroundColor)),
                                child: InkWell(
                                  onTap: () {
                                    selectedIndex = index;
                                    setState(() {});
                                  },
                                  child: Center(
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 15, right: 15),
                                      child: Text(
                                        tagName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                                color: isSelected
                                                    ? AppThemes.lightWhiteColor
                                                    : AppThemes
                                                        .lightButtonBackGroundColor,
                                                fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 12),
                        selectedIndex == 2
                            ? AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                height: 75,
                                padding: EdgeInsets.only(
                                  left: 15,
                                ),
                                child: Center(
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: listSelectDayItem.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        child: Column(
                                          children: [
                                            Text(
                                              listSelectDayItem[index].title,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4!
                                                  .copyWith(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                            Material(
                                              color: isDark
                                                  ? Colors.transparent
                                                  : AppThemes.lightWhiteColor,
                                              child: Checkbox(
                                                activeColor: AppThemes
                                                    .lightButtonBackGroundColor,
                                                value: listSelectDayItem[index]
                                                    .isSelected,
                                                onChanged: (value) {
                                                  listSelectDayItem[index]
                                                          .isSelected =
                                                      !listSelectDayItem[index]
                                                          .isSelected;
                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            : SizedBox(height: 12),
                        SizedBox(height: 12),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  getTranslator("start_from"),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                ),
                              )),
                              SizedBox(width: 24),
                              Expanded(
                                  child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  getTranslator("to_date"),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                ),
                              )),
                            ],
                          ),
                        ),
                        SizedBox(height: 6),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            children: [
                              Expanded(
                                  child: commonFloatingFormField(context, '',
                                      hintText: getTranslator("from"),
                                      callback: () {
                                Get.to(AddVacation());
                              },
                                      keyboardType: TextInputType.none,
                                      readonly: true,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10))),
                              Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Text("-"),
                              ),
                              Expanded(
                                  child: commonFloatingFormField(context, '',
                                      hintText: getTranslator("to"),
                                      readonly: true, callback: () {
                                Get.to(AddVacation());
                              },
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10))),
                            ],
                          ),
                        ),
                        SizedBox(height: 24),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              color: AppThemes.lightButtonBackGroundColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              border: Border.all(
                                  color: AppThemes.lightButtonBackGroundColor)),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Get.to(CheckoutScreen());
                                //                            CheckoutScreen
                              },
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 15, bottom: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        "₹ 35.00",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                                color:
                                                    AppThemes.lightWhiteColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                      ),
                                      Spacer(),
                                      Text(
                                        getTranslator("confirm"),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                                color: AppThemes.lightWhiteColor
                                                    .withOpacity(0.7),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20)
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
