import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk/constants/constants.dart';

import 'list_vacations.dart';

class EmptyVacation extends StatelessWidget {
  const EmptyVacation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
          color: isDark
              ? AppThemes.DarkModeColor
              : AppThemes.lightWhiteBackGroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 50),
            height: MediaQuery.of(context).size.height * 0.5,
            child: Image.asset(
              AllImages.vacations_empty,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            getTranslator("no_vacation"),
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: isDark
                      ? AppThemes.lightWhiteColor
                      : AppThemes.lightGreyColor.withOpacity(0.5),
                ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            getTranslator("add_now"),
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: AppThemes.lightButtonBackGroundColor,
                ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Get.to(ListVacations());
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
                color: AppThemes.lightWhiteBackGroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
