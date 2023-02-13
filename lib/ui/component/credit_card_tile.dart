import 'package:flutter/material.dart';
import 'package:milk/constants/constants.dart';

class CreditCardTile extends StatelessWidget {
  final String? name;
  final String? number;
  final String? date;
  final String? price;
  final Widget? editWidget;

  CreditCardTile(
      {@required this.name,
      @required this.number,
      this.date,
      this.price,
      this.editWidget});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          child: Stack(
            children: [
              Container(
                  height: 205,
                  child: Image.asset(
                    AllImages.card_bg,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
              Positioned(
                right: 20,
                bottom: 15,
                child: Image.asset(
                  AllImages.mastercard_icon,
                  height: 25,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 30, right: 15, top: 15, bottom: 20),
          height: 170,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      name ?? '',
                      style: TextStyle(
                          color: AppThemes.lightWhiteColor,
                          fontSize: 22,
                          letterSpacing: .2,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  editWidget ?? SizedBox()
                ],
              ),
              Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      number ?? '',
                      style: TextStyle(
                          color: AppThemes.lightWhiteColor,
                          fontSize: 22,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      children: [
                        Text(
                          '•••• ••••',
                          textScaleFactor: 1.3,
                          style: TextStyle(
                              color: AppThemes.lightWhiteColor,
                              fontSize: 32,
                              letterSpacing: 0.3,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      '9018',
                      style: TextStyle(
                          color: AppThemes.lightWhiteColor,
                          fontSize: 22,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w500),
                    ),
                  ]),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
              Column(mainAxisAlignment: MainAxisAlignment.end, children: []),
            ],
          ),
        ),
        Positioned(
            top: 115,
            left: 35,
            bottom: 0,
            child: Row(
              children: [
                date != null
                    ? Text(
                        date ?? '',
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color: AppThemes.lightTextFieldBackGroundColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      )
                    : Text(
                        price ?? '',
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color: AppThemes.lightTextFieldBackGroundColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w800),
                      ),
              ],
            ))
      ],
    );
  }
}
