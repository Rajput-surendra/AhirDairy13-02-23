import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk/constants/constants.dart';
import 'package:milk/ui/component/component.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/ViewProfile.dart';
import '../dashboard.dart';
import 'package:http/http.dart'as http;

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getViewProfile();
  }

var getUserId;
ViewProfile? getProfile;
  getViewProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    getUserId =  prefs.getString("userId");
    var request = http.MultipartRequest('POST', Uri.parse('${Urls.baseUrl}/view_profile.php'));
    request.fields.addAll({
      'user_id': '${getUserId}'
    });
    print("getserId--------->${request.fields}");
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final result = await response.stream.bytesToString();
      var finalData = ViewProfile.fromJson(jsonDecode(result));
      print("ViewProfile-------->${finalData.toString()}");
      setState(() {
        getProfile  = finalData;

      });
    }
    else {
    print(response.reasonPhrase);
    }

  }
  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppThemes.primaryColor,
        title: Text(getTranslator("my_profile")),
        elevation: 1,
      ),
      backgroundColor:
          isDark ? Colors.black : AppThemes.lightTextFieldBackGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // CommonAppBar(title: getTranslator("my_profile")),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),

            // Card(
            //   child: Container(
            //     height: 40,
            //     width: double.infinity,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Row(
            //           children: [
            //
            //           ],
            //         )
            //         Text("Mobile No"),
            //         Text("${getProfile!.orderHistory!.mobile}"),
            //       ],
            //     ),
            //   ),
            // ),
            // ProfileItemCard(
            //   headline: getTranslator('credit_card'),
            //   title: "3 " + getTranslator('card_linked'),
            //   leadingWidget: Image.asset(
            //     AllImages.credit_card_icon,
            //     height: 26,
            //     color: isDark ? AppThemes.lightGreyColor : null,
            //   ),
            //   trailingWidget: InkWell(
            //     onTap: () {
            //       Get.to(MyCreditCardScreen());
            //     },
            //     child: ClipRRect(
            //       borderRadius:
            //           BorderRadius.all(Radius.circular(8)),
            //       child: Container(
            //         padding: EdgeInsets.all(8),
            //         child: Image.asset(
            //           AllImages.edit_icon,
            //           width: 26,
            //           height: 26,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 25,
            // ),
            // ProfileItemCard(
            //   headline: getTranslator('delivery_address'),
            //   title: "Block A-33, Keerthi Delhi",
            //   leadingWidget: Icon(Icons.location_pin),
            // ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: AppThemes.lightGrey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)
                ),
                height: 100,
                width: double.infinity,


                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(EditProfileScreen());
                        },
                        child: Container(
                          height: 80.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                "${Urls.baseUrl}${getProfile!.orderHistory!.profileImage}",
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text(
                                      "${getProfile!.orderHistory!.name}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                          fontWeight:
                                          FontWeight.w700,
                                          fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                              // SizedBox(height: 8),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.start,
                              //   children: [
                              //     Container(
                              //       padding: EdgeInsets.only(left: 20),
                              //       child: Text(
                              //         "₹ 00.00",
                              //         style: Theme.of(context)
                              //             .textTheme
                              //             .caption!
                              //             .copyWith(
                              //                 fontWeight:
                              //                     FontWeight.w500,
                              //                 color: AppThemes
                              //                     .lightButtonBackGroundColor,
                              //                 fontSize: 14),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(EditProfileScreen());
                        },
                        child: ClipRRect(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                          child: Container(
                            color: isDark
                                ? AppThemes.smoothBlack
                                : AppThemes
                                .primaryColor,
                            padding: EdgeInsets.all(8),
                            child: Image.asset(
                              AllImages.edit_icon,
                              width: 26,
                              height: 26,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: AppThemes.lightGrey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)
                ),

                height: 80,
                width: double.infinity,
                child: ProfileItemCard(
                  headline: getTranslator('phone_number'),
                  title: "${getProfile!.orderHistory!.mobile}",
                  leadingWidget: Icon(Icons.call),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: AppThemes.lightGrey.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(10)
                ),

                height: 80,
                width: double.infinity,
                child: ProfileItemCard(
                  headline: getTranslator('Email'),
                  title: "${getProfile!.orderHistory!.email}",
                  leadingWidget: Icon(Icons.email_outlined),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
