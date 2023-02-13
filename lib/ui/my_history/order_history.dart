import 'package:flutter/material.dart';
import 'package:milk/constants/constants.dart';
import 'package:milk/ui/component/component.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
//      backgroundColor: AppThemes.lightWhiteColor,
      body: ListView.separated(
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
              child: OrderHistoryListTile(
                image: AllImages.tofu,
                name: "Tofu",
                weight: "0.5 KG",
                date: ddMMMYYYYFormat.format(DateTime.now()),
                price: "₹ 35.00",
                quantity: "4",
                total: "140.00",
                paidString: "for 6 Days",
                paidAmount: "₹ 840.00",
                onButtonClick: () {},
                onTileTap: () {},
              ));
        },
      ),
    );
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
