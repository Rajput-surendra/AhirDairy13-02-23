import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk/constants/app_themes.dart';
import 'package:milk/constants/images.dart';
import 'package:milk/themes/themeprovider.dart';
import 'package:milk/ui/my_wallet/my_wallet.dart';
import 'package:milk/ui/vacations/vacation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login/login_dashboard.dart';
import 'dashboard.dart';

class SideDrawer extends StatefulWidget {
  final int currentIndex;
  final Function(int) callback;

  SideDrawer(this.currentIndex, this.callback);

  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
//              drawerSelection.value = DrawerSelection.none;
              },
              child: Container(
                height: 170,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: <Widget>[
                    // background image and bottom contents
                    Column(
                      children: <Widget>[
                        // Container(
                        //   height: 65.0,
                        //   padding: EdgeInsets.only(right: 20),
                        //   child: Align(
                        //     alignment: Alignment.centerRight,
                        //     child: InkWell(
                        //       onTap: () {
                        //         Get.back();
                        //       },
                        //       child: Icon(Icons.arrow_back),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                        Get.to(MyProfileScreen());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text(
                                          "AHIR DAIRY",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1),
                                        ),
                                      ),
                                    ),
                                    // Container(
                                    //   padding: EdgeInsets.only(right: 20),
                                    //   child: CircleAvatar(
                                    //     backgroundColor: isDark
                                    //         ? AppThemes.smoothBlack
                                    //         : AppThemes
                                    //             .lightTextFieldBackGroundColor,
                                    //     child: AnimatedSwitcher(
                                    //         switchInCurve: Curves.easeIn,
                                    //         switchOutCurve: Curves.easeInOut,
                                    //         child: isDark
                                    //             ? IconButton(
                                    //                 onPressed: () {
                                    //                   final provider = Provider
                                    //                       .of<ThemeProvider>(
                                    //                           context,
                                    //                           listen: false);
                                    //                   provider
                                    //                       .toggleTheme(false);
                                    //                 },
                                    //                 icon: Icon(Icons.sunny))
                                    //             : IconButton(
                                    //                 onPressed: () {
                                    //                   final provider = Provider
                                    //                       .of<ThemeProvider>(
                                    //                           context,
                                    //                           listen: false);
                                    //                   provider
                                    //                       .toggleTheme(true);
                                    //                 },
                                    //                 icon:
                                    //                     Icon(Icons.mode_night)),
                                    //         duration:
                                    //             Duration(milliseconds: 1000)),
                                    //   ),
                                    // ),
                                  ],
                                ),
                                // SizedBox(height: 6),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   children: [
                                //     Container(
                                //       padding: EdgeInsets.only(left: 20),
                                //       child: Text(
                                //         "Block A-33, Keerthi Delhi",
                                //         style: TextStyle(
                                //           fontSize: 13,
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    // Profile image
                    Positioned(
                      top: 40.0,
                      left: 20,
                      // (background container size) - (circle height / 2)
                      child: InkWell(
                        onTap: () {
                          Get.back();
                          Get.to(MyProfileScreen());
                        },
                        child: Container(
                          height: 55.0,
                          width: 55.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: isDark
                                    ? Colors.white.withOpacity(0.1)
                                    : Colors.grey.withOpacity(0.5),
                                offset: Offset(4.0, 4.0),
                                blurRadius: 10.0,
                                spreadRadius: 5.0,
                              ),
                            ],
                          ),
                          child: ClipOval(
                              child: Image.network(
                            "https://picsum.photos/200/300/?blur",
                            fit: BoxFit.cover,
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: Container(
            //     decoration: BoxDecoration(
            //         color: AppThemes.lightButtonBackGroundColor,
            //         borderRadius: BorderRadius.only(
            //             topLeft: Radius.circular(16),
            //             bottomLeft: Radius.circular(16))),
            //     padding:
            //         EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
            //     child: Text(
            //       "₹ 00.00",
            //       style: Theme.of(context).textTheme.headline6!.merge(
            //             TextStyle(
            //                 color: AppThemes.lightWhiteColor, fontSize: 16),
            //           ),
            //     ),
            //   ),
            // ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                minLeadingWidth: 0,
                selected: widget.currentIndex == 0,
                selectedTileColor: Theme.of(context).dividerColor,
                onTap: () {
                  Get.back();
                  widget.callback.call(0);
                },
                leading: Image.asset(
                  AllImages.home,
                  color: isDark
                      ? AppThemes.lightGreyColor
                      : AppThemes.lightBlackColor,
                  width: 30,
                ),
                title: Text(
                  "Home",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                minLeadingWidth: 0,
                selected: widget.currentIndex == 1,
                selectedTileColor: Theme.of(context).dividerColor,
                onTap: () {
                  Get.back();
                  Get.to(MyWalletScreen());
//                  widget.callback.call(1);
                },
                leading: Image.asset(
                  AllImages.wallet,
                  color: isDark
                      ? AppThemes.lightGreyColor
                      : AppThemes.lightBlackColor,
                  width: 30,
                ),
                title: Text(
                  "My Wallet",
                  //S.of(context).home,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
//             Container(
//               height: 50,
//               margin: EdgeInsets.symmetric(vertical: 5),
//               child: ListTile(
//                 minLeadingWidth: 0,
//
// //            selected: drawerSelection.value == DrawerSelection.challan,
//                 selectedTileColor: Theme.of(context).dividerColor,
//                 onTap: () {
//                   Get.back();
//                   Get.to(Vacations());
// //              drawerSelection.value = DrawerSelection.challan;
// //              Navigator.of(context).pushNamed('/Pages', arguments: 2);
//                 },
//                 leading: Image.asset(
//                   AllImages.vacation,
//                   color: isDark
//                       ? AppThemes.lightGreyColor
//                       : AppThemes.lightBlackColor,
//                   fit: BoxFit.cover,
//                   width: 30,
//                 ),
//                 title: Text(
//                   "My Vacations",
//                   style: Theme.of(context).textTheme.subtitle1,
//                 ),
//               ),
//             ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                minLeadingWidth: 0,
                selected: widget.currentIndex == 3,
                selectedTileColor: Theme.of(context).dividerColor,
                onTap: () {
                  Get.back();
                  widget.callback.call(3);
                },
                leading: Image.asset(
                  AllImages.history,
                  color: isDark
                      ? AppThemes.lightGreyColor
                      : AppThemes.lightBlackColor,
                  width: 30,
                ),
                title: Text(
                  "My Order",
                  //S.of(context).home,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                minLeadingWidth: 0,
                selected: widget.currentIndex == 4,
                selectedTileColor: Theme.of(context).dividerColor,
                onTap: () {
                  Get.back();
                  widget.callback.call(4);
                },
                leading: Image.asset(
                  AllImages.calender,
                  color: isDark
                      ? AppThemes.lightGreyColor
                      : AppThemes.lightBlackColor,
                  width: 30,
                ),
                title: Text(
                  "My Subscriptions",
                  //S.of(context).home,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
            Container(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                child: Divider(
                  color:
                      isDark ? AppThemes.smoothBlack : AppThemes.lightGreyColor,
                  thickness: 0.5,
                )),
//             Container(
//               height: 50,
//               margin: EdgeInsets.symmetric(vertical: 5),
//               child: ListTile(
//                 minLeadingWidth: 0,
//                 selectedTileColor: Theme.of(context).dividerColor,
//                 onTap: () {
//                   Get.back();
//                   Get.to(ContactUsScreen());
//                 },
//                 leading: Image.asset(
//                   AllImages.contact,
//                   color: isDark
//                       ? AppThemes.lightGreyColor
//                       : AppThemes.lightBlackColor,
//                   width: 30,
//                 ),
//                 title: Text(
//                   "Contact Us",
//                   //S.of(context).home,
//                   style: Theme.of(context).textTheme.subtitle1,
//                 ),
//               ),
//             ),
//             Container(
//               height: 50,
//               margin: EdgeInsets.symmetric(vertical: 5),
//               child: ListTile(
//                 minLeadingWidth: 0,
//                 selectedTileColor: Theme.of(context).dividerColor,
//                 onTap: () {
// //              pushPage(context, ContactUs());
//                 },
//                 leading: Image.asset(
//                   AllImages.setting,
//                   color: isDark
//                       ? AppThemes.lightGreyColor
//                       : AppThemes.lightBlackColor,
//                   width: 30,
//                 ),
//                 title: Text(
//                   "Settings",
//                   //S.of(context).home,
//                   style: Theme.of(context).textTheme.subtitle1,
//                 ),
//               ),
//             ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                minLeadingWidth: 0,
                selectedTileColor: Theme.of(context).dividerColor,
                onTap: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setString("userId","");
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginDashboard()));
                },
                leading: Image.asset(
                  AllImages.logout,
                  color: isDark
                      ? AppThemes.lightGreyColor
                      : AppThemes.lightBlackColor,
                  width: 30,
                ),
                title: Text(
                  "Logout",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
