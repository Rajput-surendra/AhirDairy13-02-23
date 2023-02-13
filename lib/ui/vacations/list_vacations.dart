import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk/constants/constants.dart';
import 'package:milk/ui/vacations/add_vacation.dart';

class ListVacations extends StatelessWidget {
  const ListVacations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        backgroundColor:
            isDark ? Colors.black : AppThemes.lightWhiteBackGroundColor,
        floatingActionButton: InkWell(
          onTap: () {
            Get.to(AddVacation());
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppThemes.lightButtonBackGroundColor,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.add,
              size: 30,
              color: isDark
                  ? AppThemes.DarkModeColor
                  : AppThemes.lightWhiteBackGroundColor,
            ),
          ),
        ),
        body: SafeArea(
            child: Column(children: [
          Container(
            height: 60,
            padding: EdgeInsets.only(left: 25, right: 25),
            color:
                isDark ? Colors.black : AppThemes.lightTextFieldBackGroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  getTranslator("my_vacations"),
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                60,
            decoration: BoxDecoration(
              color: isDark
                  ? AppThemes.DarkModeColor
                  : AppThemes.lightWhiteBackGroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 23),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppThemes.DarkModeColor
                        : AppThemes.lightWhiteBackGroundColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: isDark
                            ? Colors.grey.withOpacity(0.1)
                            : Colors.grey.shade100.withOpacity(0.7),
                        blurRadius: 5,
                        spreadRadius: 3,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getTranslator("from"),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: AppThemes.lightTextGreyColor,
                                  ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "06 Feb 2020",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: VerticalDivider(
                            color: AppThemes.lightTextGreyColor,
                            thickness: 0.4,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getTranslator("to"),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: AppThemes.lightTextGreyColor,
                                  ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "06 Feb 2020",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ])));
  }
}
