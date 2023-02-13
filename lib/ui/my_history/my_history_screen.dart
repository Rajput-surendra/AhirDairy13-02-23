import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk/constants/constants.dart';
import 'package:milk/ui/component/component.dart';
import 'package:milk/ui/dashboard/dashboard.dart';
import 'my_history.dart';

class MyHistoryScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> parentScaffoldKey;
  final Function(int) callback;

  MyHistoryScreen(
      {Key? key, required this.parentScaffoldKey, required this.callback})
      : super(key: key);

  @override
  _MyHistoryScreenState createState() => _MyHistoryScreenState();
}

class _MyHistoryScreenState extends State<MyHistoryScreen> {
  late int currentPage;
  PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    currentPage = 0;
    pageController = PageController(initialPage: currentPage);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return WillPopScope(
      onWillPop: () async {
        await Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => DashBoardScreen()));
        return true;
      },
      child: Scaffold(
        backgroundColor:
            isDark ? Colors.black : AppThemes.lightWhiteBackGroundColor,
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
                        padding: EdgeInsets.only(left: 0, bottom: 0, right: 10),
                        prefixIcon: Icon(Icons.search,
                            size: 28, color: AppThemes.lightTextGreyColor)),
                  ),
                ],
              ),
            )),
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
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1,
                      right: MediaQuery.of(context).size.width * 0.1,
                      top: 20,
                      bottom: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            pageController.jumpToPage(0);
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 8, bottom: 8),
                            decoration: BoxDecoration(
                                color: currentPage == 0
                                    ? AppThemes.lightButtonBackGroundColor
                                    : isDark
                                        ? AppThemes.smoothBlack.withOpacity(0.1)
                                        : AppThemes.lightWhiteColor,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    color: AppThemes.lightButtonBackGroundColor,
                                    width: 1)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                getTranslator("orders"),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: currentPage == 0
                                            ? AppThemes.lightWhiteColor
                                            : AppThemes
                                                .lightButtonBackGroundColor,
                                        fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            pageController.jumpToPage(1);
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 8, bottom: 8),
                            decoration: BoxDecoration(
                                color: currentPage == 1
                                    ? AppThemes.lightButtonBackGroundColor
                                    : isDark
                                        ? AppThemes.smoothBlack.withOpacity(0.1)
                                        : AppThemes.lightWhiteColor,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    color: AppThemes.lightButtonBackGroundColor,
                                    width: 1)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                getTranslator("payment"),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: currentPage == 1
                                            ? AppThemes.lightWhiteColor
                                            : AppThemes
                                                .lightButtonBackGroundColor,
                                        fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      print("Current Index $index");
                      currentPage = index;
                      setState(() {});
                    },
                    children: [
                      OrderHistory(),
                      PaymentHistory(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
