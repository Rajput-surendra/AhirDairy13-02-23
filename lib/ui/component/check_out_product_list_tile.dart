import 'package:flutter/material.dart';
import 'package:milk/constants/constants.dart';

class CheckOutProductListTile extends StatefulWidget {
  final String image;
  final String? name;
  final String weight;
  final String? displayPrice;
  final String? actualPrice;
  final VoidCallback? onTileTap;

  CheckOutProductListTile(
      {required this.image,
      this.name,
      required this.weight,
      this.displayPrice,
      this.actualPrice,
      this.onTileTap});

  @override
  _CheckOutProductListTileState createState() =>
      _CheckOutProductListTileState();
}

class _CheckOutProductListTileState extends State<CheckOutProductListTile> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: widget.onTileTap,
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.asset(
                widget.image,
                height: 95,
                width: 76,
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
                    Text(
                      widget.name ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    Text(
                      " - " + widget.weight,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.displayPrice!,
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppThemes.lightTextGreyColor,
                                  fontSize: 13,
                                  decoration: TextDecoration.lineThrough),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.actualPrice!,
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppThemes.lightBlueColor,
                                  fontSize: 13),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
          InkWell(
            onTap: () {
              if (count >= 1) {
                count -= 1;
                setState(() {});
              }
            },
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                child: Container(
                    padding: EdgeInsets.all(6),
                    color: isDark
                        ? AppThemes.smoothBlack
                        : AppThemes.lightTextFieldBackGroundColor,
                    child: Icon(Icons.remove,
                        color: AppThemes.lightRedColor, size: 20))),
          ),
          Container(
            padding: EdgeInsets.only(left: 6, right: 6),
            child: Text(
              count.toString(),
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 15),
            ),
          ),
          InkWell(
            onTap: () {
              count += 1;
              setState(() {});
            },
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                child: Container(
                    padding: EdgeInsets.all(6),
                    color: isDark
                        ? AppThemes.smoothBlack
                        : AppThemes.lightTextFieldBackGroundColor,
                    child: Icon(Icons.add,
                        color: AppThemes.lightButtonBackGroundColor,
                        size: 20))),
          ),
        ],
      ),
    );
  }
}
