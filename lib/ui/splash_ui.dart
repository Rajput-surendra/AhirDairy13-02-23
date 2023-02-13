import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk/constants/constants.dart';
import 'package:milk/ui/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard/dashboard_screen.dart';
import 'dashboard/home_screen.dart';

class SplashUI extends StatefulWidget {
  const SplashUI({Key? key}) : super(key: key);

  @override
  _SplashUIState createState() => _SplashUIState();
}

class _SplashUIState extends State<SplashUI> {
  @override
  void initState() {
    super.initState();
    validateSession();
  }

 var userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppThemes.primaryColor,
//          appBar: AppBar(
//            backgroundColor: AppThemes.lightButtonBackGroundColor,
//            elevation: 0,
//          ),
      body: Container(

    // decoration: BoxDecoration(
    //   image: DecorationImage(
    //     image: AssetImage("assets/images/splashback.png"),
    //
    //   )
    // ),
    child: Center(
      child: Container(
        height: 350,
        width: 250,
        child: Image.asset("assets/images/splash_header.png", fit: BoxFit.contain),

      ),
    )
    )

      // Image.asset("assets/images/splash_header.png",
      //   fit: BoxFit.fill,
      // ),
    );
  }

  Future<void> validateSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   setState(() {
     userId = prefs.getString("userId");

   });
  if(userId == null || userId == ""){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginDashboard()));
  }else(
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashBoardScreen()))
  );
  }

}
