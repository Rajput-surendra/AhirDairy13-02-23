import 'package:flutter/material.dart';
import 'package:milk/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderHistoryListTile extends StatefulWidget {
  final String image;
  final String name;
  final String weight;
  final String date;
  final String price;
  final String quantity;
  final String total;
  final String paidString;
  final String paidAmount;
  final VoidCallback onButtonClick;
  final VoidCallback onTileTap;

  OrderHistoryListTile(
      {required this.image,
      this.name = '',
      this.weight = '',
      this.date = '',
      this.price = '',
      this.quantity = '',
      this.total = '',
      this.paidString = '',
      this.paidAmount = '',
      required this.onButtonClick,
      required this.onTileTap});

  @override
  _OrderHistoryListTileState createState() => _OrderHistoryListTileState();
}

class _OrderHistoryListTileState extends State<OrderHistoryListTile> {
  bool switchControl = false;

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: widget.onTileTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      widget.image,
                      height: 75,
                      width: 75,
                      fit: BoxFit.cover,
                    )),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(left: 12, right: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.name + " - " + widget.weight,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                            ),
                          ),
                          Text(
                            widget.date,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: isDark
                                        ? AppThemes.lightWhiteColor
                                        : AppThemes.lightTextGreyColor,
                                    fontSize: 13),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    widget.price,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: AppThemes
                                                .lightButtonBackGroundColor,
                                            fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "X" + widget.quantity,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            "= " + widget.total,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppThemes.lightButtonBackGroundColor,
                                    fontSize: 15),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 8, top: 6, bottom: 4),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.paidString,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 13),
                    ),
                  ),
                  Text(
                    getTranslator("total_paid"),
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppThemes.lightTextGreyColor,
                        fontSize: 13),
                  ),
                  SizedBox(width: 10),
                  Text(
                    widget.paidAmount,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppThemes.lightAmountColor,
                        fontSize: 22),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 15, top: 2, bottom: 10),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    child: Transform.scale(
                        scale: 1.35,
                        child: Switch.adaptive(
                          onChanged: toggleSwitch,
                          value: switchControl,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          activeColor: AppThemes.lightButtonBackGroundColor,
                          activeTrackColor: isDark
                              ? AppThemes.smoothBlack
                              : AppThemes.lightGreyBackGroundColor,
                          inactiveThumbColor: isDark
                              ? AppThemes.smoothBlack.withOpacity(0.1)
                              : AppThemes.lightWhiteColor,
                          inactiveTrackColor: isDark
                              ? AppThemes.smoothBlack
                              : AppThemes.lightGreyBackGroundColor,
                        )),
                  ),
                  SizedBox(width: 10),
                  Text(
                    switchControl
                        ? getTranslator("active")
                        : getTranslator("inactive"),
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppThemes.lightButtonBackGroundColor,
                        fontSize: 15),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.8,
                      padding: EdgeInsets.only(
                          top: 8, bottom: 8, left: 10, right: 2),
                      decoration: BoxDecoration(
                          color: AppThemes.lightDeepOrangeAccentColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: isDark
                                  ? AppThemes.lightWhiteColor.withOpacity(0.5)
                                  : AppThemes.lightWhiteColor,
                              width: 1)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              getTranslator("cancel"),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppThemes.lightWhiteColor,
                                      fontSize: 15),
                            ),
                            SvgPicture.asset('assets/images/delete.svg',
                                color: AppThemes.lightWhiteColor),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void toggleSwitch(bool value) {
    if (switchControl == false) {
      setState(() {
        switchControl = true;
      });
      print('Switch is ON');
      // Put your code here which you want to execute on Switch ON event.

    } else {
      setState(() {
        switchControl = false;
      });
      print('Switch is OFF');
      // Put your code here which you want to execute on Switch OFF event.
    }
  }
}
