import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleTextView extends StatelessWidget {
  final String title;

  TitleTextView({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headline5
          ?.copyWith(fontSize: 28, fontWeight: FontWeight.w700),
    );
  }
}

class CommonAppBar extends StatelessWidget {
  final String title;

  CommonAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.06,
          right: MediaQuery.of(context).size.width * 0.06),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.w700, fontSize: 21),
              textAlign: TextAlign.left,
            ),
          ),

        ],
      ),
    );
  }
}
