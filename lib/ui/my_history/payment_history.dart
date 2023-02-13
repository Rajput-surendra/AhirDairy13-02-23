import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk/constants/constants.dart';
import 'package:milk/ui/component/payment_history_list_tile.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({
    this.isNotified = false,
    Key? key,
  }) : super(key: key);

  final bool isNotified;

  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      widget.isNotified == true
          ? Container(
              height: 60,
              color: isDark
                  ? Colors.black
                  : AppThemes.lightTextFieldBackGroundColor,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    getTranslator("Notifications"),
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(fontWeight: FontWeight.w700, fontSize: 21),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back),
                  )
                ],
              ),
            )
          : SizedBox(),
      Expanded(
        child: ListView.separated(
          itemCount: 5,
          separatorBuilder: (context, index) {
            return SizedBox(height: 20);
          },
          itemBuilder: (context, index) {
            return Container(
                margin: getFirstNLastMergin(index, 5),
                decoration: BoxDecoration(
                    color: isDark
                        ? AppThemes.smoothBlack.withOpacity(0.4)
                        : AppThemes.lightWhiteBackGroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: index % 2 != 0
                    ? PaymentHistoryListTile(
                        date: ddMMMYYYYFormat.format(DateTime.now()),
                        paymentMethod: "PayPal",
                        methodId: "loremmail@gmail.com",
                        balance: "₹ 1000.00",
                        onTileTap: () {},
                      )
                    : PaymentHistoryListTile(
                        date: ddMMMYYYYFormat.format(DateTime.now()),
                        paymentMethod: "Credit Card",
                        methodId: "4756 **** **** 9018",
                        balance: "₹ 840.00",
                        onTileTap: () {},
                      ));
          },
        ),
      ),
    ])));
  }

  getFirstNLastMergin(int index, int length) {
    if (index == 0) {
      return EdgeInsets.only(left: 15, right: 15, top: 20);
    } else if (index == length - 1) {
      return EdgeInsets.only(left: 15, right: 15, bottom: 75);
    }
    return EdgeInsets.only(left: 15, right: 15);
  }
}
