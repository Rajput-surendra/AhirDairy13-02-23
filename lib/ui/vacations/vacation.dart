import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk/constants/constants.dart';

import 'empty_vacation.dart';

class Vacations extends StatefulWidget {
  const Vacations({Key? key}) : super(key: key);

  @override
  _VacationsState createState() => _VacationsState();
}

class _VacationsState extends State<Vacations> {
  bool isData = false;
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
              padding: EdgeInsets.only(left: 25, right: 25),
              color: isDark
                  ? Colors.black
                  : AppThemes.lightTextFieldBackGroundColor,
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
            Expanded(
              child: EmptyVacation(),
            )
          ],
        ),
      ),
    );
  }
}
