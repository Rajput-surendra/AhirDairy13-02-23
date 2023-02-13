import 'package:flutter/material.dart';
import 'package:milk/constants/constants.dart';

class SearchProductListTile extends StatelessWidget {
  final String? image;
  final String? name;
  final String? weight;
  final String? displayPrice;
  final String? actualPrice;
  final VoidCallback onTileTap;
  final VoidCallback onCartTap;

  SearchProductListTile(
      {this.image,
      this.name,
      this.weight,
      this.displayPrice,
      this.actualPrice,
      required this.onTileTap,
      required this.onCartTap});

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: onTileTap,
      child: Row(
        children: [
          Container(
            height: 100,
            width: 115,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(image!),
                fit: BoxFit.cover,
              ),
            ),
          ),
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
                        name!,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  weight!,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.w400, fontSize: 15),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      displayPrice ?? '',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppThemes.lightTextGreyColor,
                          fontSize: 13,
                          decoration: TextDecoration.lineThrough),
                    ),
                    SizedBox(width: 10),
                    Text(
                      actualPrice ?? '',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppThemes.lightButtonBackGroundColor,
                          fontSize: 15),
                    )
                  ],
                )
              ],
            ),
          )),
          InkWell(
            onTap: onCartTap,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                child: Container(
                    padding: EdgeInsets.all(8),
                    color: isDark
                        ? AppThemes.smoothBlack
                        : AppThemes.lightTextFieldBackGroundColor,
                    child: Icon(Icons.add_shopping_cart_outlined,
                        color: AppThemes.lightButtonBackGroundColor))),
          ),
        ],
      ),
    );
  }
}
