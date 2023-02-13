import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk/constants/constants.dart';
import 'package:milk/ui/component/component.dart';
import 'package:milk/ui/product/product.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart'as http;

import '../../model/CateModel.dart';
import '../../model/SliderModel.dart';
import 'dashboard.dart';

class HomeScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState>? parentScaffoldKey;
  final Function(int)? callback;

  HomeScreen({Key? key, this.parentScaffoldKey,this.callback})
      : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> parentScaffoldKey = GlobalKey();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  new GlobalKey<RefreshIndicatorState>();
  SliderModel? sliderBanner;
  SliderModel? homeSliderList;
  int currentindex = 0;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   Future.delayed(Duration(seconds: 1),(){
     getSlider();
     getCat();
   });
  }

  CateModel? catModel;
  getCat() async {
    var request = http.Request('POST', Uri.parse('${Urls.baseUrl}/get_category.php'));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final result = await response.stream.bytesToString();
      var finalData1 = CateModel.fromJson(jsonDecode(result));
      print("this is respoce===${finalData1.toString()}");
      setState(() {
        catModel = finalData1;

      });
    }
    else {
    print(response.reasonPhrase);
    }

  }

  getSlider() async {
    var request = http.Request('POST', Uri.parse('${Urls.baseUrl}get_banner.php'));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final result = await response.stream.bytesToString();
      var finalData = SliderModel.fromJson(jsonDecode(result));
      print("ADDDADDADADDDDADADDDADDA===${finalData.toString()}");
      setState(() {
        homeSliderList = finalData;

      });
    }

    else {
      print(response.reasonPhrase);
    }

  }

  Future<Null> _refresh(){
    return getSlider();
  }

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return RefreshIndicator(
      key:_refreshIndicatorKey,
      onRefresh: _refresh,
      child: Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.sort, color: Theme.of(context).hintColor),
            onPressed: () {
              widget.parentScaffoldKey!.currentState?.openDrawer();
            },
          ),
          automaticallyImplyLeading: false,
          // backgroundColor: AppThemes.primaryColor,
          backgroundColor: isDark
              ? AppThemes.DarkModeColor
              : AppThemes.lightTextFieldBackGroundColor,
          elevation: 1,
          title: InkWell(
            onTap: () {
              Get.to(SearchForProduct());
            },
            child: IgnorePointer(
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: commonFloatingFormField(context, '',
                          hintText: getTranslator('search'),
                          fieldHeight: 40,
                          color: isDark
                              ? AppThemes.smoothBlack
                              : AppThemes.lightWhiteBackGroundColor,
                          contentPadding: EdgeInsets.only(bottom: 10),
                          floatingHint: FloatingLabelBehavior.always,
                          padding: EdgeInsets.only(left: 0, bottom: 0, right: 10),
                          prefixIcon: Icon(Icons.search,
                              size: 28, color: AppThemes.lightTextGreyColor)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            ShoppingCartButtonWidget(
                iconColor:
                    isDark ? AppThemes.lightGreyColor : AppThemes.lightBlackColor,
                labelColor: AppThemes.lightDeepOrangeAccentColor),
            NotificationButtonWidget(
                scaffoldKey: widget.parentScaffoldKey,
                iconColor:
                    isDark ? AppThemes.lightGreyColor : AppThemes.lightBlackColor,
                labelColor: AppThemes.lightDeepOrangeAccentColor),
            SizedBox(width: 15)
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              // decoration: BoxDecoration(
              //     color: isDark
              //         ? Colors.grey.withOpacity(0.1)
              //         : AppThemes.lightWhiteBackGroundColor,
              //     borderRadius: BorderRadius.only(
              //         topLeft: Radius.circular(15), topRight: Radius.circular(15))),
              children: [
                SingleChildScrollView(
                  child: Container(
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height - 60),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          homeSliderList == null ? CircularProgressIndicator():Container(
                            height: 180,
                            width: double.infinity,
                            // width: double.infinity,
                            child:  Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  viewportFraction: 1.0,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                  Duration(milliseconds: 150),
                                  enlargeCenterPage: false,
                                  scrollDirection: Axis.horizontal,
                                  height: 180,
                                  onPageChanged: (position, reason) {
                                    setState(() {
                                      currentindex = position;
                                    });
                                    print(reason);
                                    print(CarouselPageChangedReason.controller);
                                  },
                                ),
                                items: homeSliderList!.banneritem!.map((val) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    // height: 180,
                                    // width: MediaQuery.of(context).size.width,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          "${Urls.imageUrl}${val.bimg}",
                                          fit: BoxFit.cover,
                                        )),
                                  );
                                }).toList(),
                              ),
                            ),

                            // ListView.builder(
                            //   scrollDirection: Axis.horizontal,
                            //   shrinkWrap: true,
                            //   //physics: NeverScrollableScrollPhysics(),
                            //   itemCount: homeSliderList!.banneritem!.length,
                            //   itemBuilder: (context, index) {
                            //     return
                            //
                            //     //   InkWell(
                            //     //   onTap: () {
                            //     //     // Get.to(ProductListScreen(
                            //     //     //     parentScaffoldKey: widget.parentScaffoldKey));
                            //     //     widget.callback!.call(11);
                            //     //   },
                            //     //   child: Image.network("${Urls.imageUrl}${sliderBanner!.banneritem![0].bimg}"),
                            //     //   // Container(
                            //     //   //   margin: getFirstNLastMergin(index, 5),
                            //     //   //   width: MediaQuery.of(context).size.width * 0.8,
                            //     //   //   decoration: BoxDecoration(
                            //     //   //       color: (index + 1) % 2 == 0
                            //     //   //           ? AppThemes.lightRedColor
                            //     //   //           : AppThemes.lightYellowColor,
                            //     //   //       borderRadius:
                            //     //   //           BorderRadius.all(Radius.circular(10))
                            //     //   //   ),
                            //     //   // ),
                            //     // );
                            //   },
                            // ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,bottom: 5),
                            child: Text("Category",style: TextStyle(
                              color: AppThemes.lightBlackColor,fontWeight: FontWeight.bold,fontSize: 18
                            ),),
                          ),
                          Container(
                            height: 150,
                            width: double.infinity,
                            child: ListView.builder(
                                 itemCount:catModel!.cityitem!.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: AlwaysScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Container(
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                        color: AppThemes.primaryColor),
                                         height: 80,
                                        width: 80,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                            child: Image.network("${Urls.imageUrl}${catModel!.cityitem![index].cimg}",fit: BoxFit.cover,)),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text("${catModel!.cityitem![index].title}")
                                  ],
                                ),
                              );

                                }
                            )
                          ),
                          InkWell(
                            onTap: () {
                              widget.callback!.call(11);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              height: MediaQuery.of(context).size.height * 0.15,
                              decoration: BoxDecoration(
                                  color: AppThemes.lightGreenColor,
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              getTranslator("dairy_goodness"),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(fontWeight: FontWeight.w700, fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    widget.callback!.call(11);
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.20,
                                    width: MediaQuery.of(context).size.width * 0.27,
                                    decoration: BoxDecoration(
                                        color: AppThemes.lightBlueColor,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      widget.callback!.call(11);
                                    },
                                    child: Container(
                                      height: MediaQuery.of(context).size.height * 0.20,
                                      decoration: BoxDecoration(
                                          color: AppThemes.lightYellowColor,
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height:
                                    (MediaQuery.of(context).size.width - 75) * 0.3,
                                    decoration: BoxDecoration(
                                        color: AppThemes.lightGreenColor,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  child: Container(
                                    height:
                                    (MediaQuery.of(context).size.width - 75) * 0.3,
                                    decoration: BoxDecoration(
                                        color: AppThemes.lightRedColor,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  child: Container(
                                    height:
                                    (MediaQuery.of(context).size.width - 75) * 0.3,
                                    decoration: BoxDecoration(
                                        color: AppThemes.lightBlueColor,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              getTranslator("dairy_goodness"),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(fontWeight: FontWeight.w700, fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.callback!.call(11);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              height: MediaQuery.of(context).size.height * 0.10,
                              decoration: BoxDecoration(
                                  color: AppThemes.lightYellowColor,
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.callback!.call(11);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              height: MediaQuery.of(context).size.height * 0.10,
                              decoration: BoxDecoration(
                                  color: AppThemes.lightYellowColor,
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              getTranslator("dairy_goodness"),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(fontWeight: FontWeight.w700, fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.callback!.call(11);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              height: MediaQuery.of(context).size.height * 0.30,
                              decoration: BoxDecoration(
                                  color: AppThemes.lightRedColor,
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              getTranslator("dairy_goodness"),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(fontWeight: FontWeight.w700, fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 100,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: ListView.builder(
                              itemCount: 20,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(ProductDetailScreen());
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 75,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: AppThemes.lightRedColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.symmetric(horizontal: 5),
                                          child: Text(
                                            "Eggs",
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  getFirstNLastMergin(int index, int length) {
    if (index == 0) {
      return EdgeInsets.only(left: 15);
    } else if (index == length - 1) {
      return EdgeInsets.only(right: 15);
    }
    return null;
  }
}
