import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:milk/constants/constants.dart';
import 'package:milk/ui/login/login.dart';

late TabController loginTabController;

class LoginDashboard extends StatefulWidget {
  @override
  _LoginDashboardState createState() => _LoginDashboardState();
}

class _LoginDashboardState extends State<LoginDashboard>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    loginTabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    loginTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return WillPopScope(
          onWillPop: () async {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Confirm Exit"),
                    content: Text("Are you sure you want to exit?"),
                    actions: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: AppThemes.primaryColor
                        ),
                        child: Text("YES"),
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: AppThemes.primaryColor
                        ),
                        child: Text("NO"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                }
            );
            // if (_tabController.index != 0) {
            //   _tabController.animateTo(0);
            //   return false;
            // }
            return true;
          },
      child: Scaffold(
        backgroundColor:
            isDark ? Colors.black : AppThemes.lightTextFieldBackGroundColor,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 60,
                color: AppThemes.primaryColor,
                child: TabBar(
                  controller: loginTabController,
                  indicator: BoxDecoration(),
                  labelColor: isDark
                      ? AppThemes.lightWhiteColor
                      : AppThemes.lightWhiteColor,
                  unselectedLabelColor: AppThemes.lightTextGreyColor,
                  tabs: [
                    Tab(
                      child: Text(
                        getTranslator("sign_up"),
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        getTranslator("sign_in"),
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              // tab bar view here
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: AppThemes.lightWhiteBackGroundColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: TabBarView(
                    controller: loginTabController,
                    children: [
                      SignUpScreen(),
                      SignInScreen(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  //  exitButton(){
  //   return  showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text("Confirm Exit"),
  //           content: Text("Are you sure you want to exit?"),
  //           actions: <Widget>[
  //             ElevatedButton(
  //               style: ElevatedButton.styleFrom(
  //                   primary: AppThemes.primaryColor
  //               ),
  //               child: Text("YES"),
  //               onPressed: () {
  //                 SystemNavigator.pop();
  //               },
  //             ),
  //             ElevatedButton(
  //               style: ElevatedButton.styleFrom(
  //                   primary: AppThemes.primaryColor
  //               ),
  //               child: Text("NO"),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             )
  //           ],
  //         );
  //       }
  //   );
  // }

}

