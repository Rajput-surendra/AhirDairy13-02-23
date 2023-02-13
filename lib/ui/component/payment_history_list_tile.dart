import 'package:flutter/material.dart';
import 'package:milk/constants/constants.dart';

class PaymentHistoryListTile extends StatelessWidget {
  final String date;
  final String paymentMethod;
  final String methodId;
  final String balance;
  final VoidCallback onTileTap;

  PaymentHistoryListTile(
      {this.date = '',
      this.paymentMethod = '',
      this.methodId = '',
      this.balance = '',
      required this.onTileTap});

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: onTileTap,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    getTranslator("payment_method"),
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: isDark
                            ? AppThemes.lightWhiteColor.withOpacity(0.7)
                            : AppThemes.lightTextGreyColor,
                        fontSize: 13),
                  ),
                ),
                Text(
                  date,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: isDark
                          ? AppThemes.lightWhiteColor.withOpacity(0.7)
                          : AppThemes.lightTextGreyColor,
                      fontSize: 13),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      paymentMethod,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      methodId,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.w800, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text(
                  getTranslator("balance_added"),
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: isDark
                          ? AppThemes.lightWhiteColor.withOpacity(0.7)
                          : AppThemes.lightTextGreyColor,
                      fontSize: 13),
                ),
                Spacer(),
                Text(
                  balance,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppThemes.lightAmountColor,
                      fontSize: 20),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
