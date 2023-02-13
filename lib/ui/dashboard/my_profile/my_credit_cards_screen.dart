import 'package:flutter/material.dart';
import 'package:milk/constants/constants.dart';
import 'package:milk/ui/component/component.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCreditCardScreen extends StatefulWidget {
  @override
  _MyCreditCardScreenState createState() => _MyCreditCardScreenState();
}

class _MyCreditCardScreenState extends State<MyCreditCardScreen> {
  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor:
          isDark ? Colors.black : AppThemes.lightTextFieldBackGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            CommonAppBar(title: getTranslator("credit_cards")),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: isDark
                        ? AppThemes.DarkModeColor
                        : AppThemes.lightWhiteBackGroundColor,
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
                              color: AppThemes.lightWhiteColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: CreditCardTile(
                            name: "Card Name",
                            number: "4756",
                            date: "09 / 26",
                            editWidget: Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    child: Container(
                                      color: isDark
                                          ? AppThemes.DarkModeColor.withOpacity(
                                              0.6)
                                          : AppThemes.lightWhiteColor,
                                      padding: EdgeInsets.all(6),
                                      child: Image.asset(
                                        AllImages.edit_icon,
                                        width: 26,
                                        height: 26,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                                InkWell(
                                  onTap: () {},
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    child: Container(
                                      color: AppThemes.lightRedColor,
                                      padding: EdgeInsets.all(6),
                                      child: SvgPicture.asset(
                                        'assets/images/delete.svg',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
}

getFirstNLastMergin(int index, int length) {
  if (index == 0) {
    return EdgeInsets.only(left: 15, right: 15, top: 20);
  } else if (index == length - 1) {
    return EdgeInsets.only(left: 15, right: 15, bottom: 75);
  }
  return EdgeInsets.only(left: 15, right: 15);
}
