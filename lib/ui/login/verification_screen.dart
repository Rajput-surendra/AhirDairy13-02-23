import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:milk/constants/constants.dart';
import 'package:milk/controllers/verification_controller.dart';
import 'package:milk/ui/component/component.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dashboard/dashboard_screen.dart';
import 'package:http/http.dart'as http;
import 'login.dart';

class VerificationScreen extends StatefulWidget {
  VerificationScreen({
    // this.isSignUp = false,
    this.newOtp,
    this.mobile});


  final newOtp,mobile;
  // final bool isSignUp;

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends StateMVC<VerificationScreen> {
  late VerificationController _con;
  TextEditingController pinputController = TextEditingController();



  _VerificationScreenState() : super(VerificationController()) {
    _con = controller as VerificationController;
  }

 verifyOtp() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();

    print("new number====>${widget.mobile}");
  var request = http.MultipartRequest('POST', Uri.parse('${Urls.baseUrl}verify_otp.php'));
  request.fields.addAll({
    'mobile': widget.mobile,
    'otp': pinputController.text,
    'device_token': '${token.toString()}'
  });
  print("this is a request-------------->${request.fields}");
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    final result = await response.stream.bytesToString();
    var finalData = json.decode(result);
    Fluttertoast.showToast(msg: "${finalData['ResponseMsg']}");
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString('email', 'useremail@gmail.com');
    var userId = finalData['user_mobile']["id"];
    print("User id+++++++++++++++++>${userId}");

    prefs.setString("userId",userId);

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashBoardScreen()));
    print("this is a respoce---------->${finalData}");
  }
  else {
  print(response.reasonPhrase);
  }

}
  String? token;
  getToken() async {
    token = await FirebaseMessaging.instance.getToken();
  }

  @override
  void initState() {
    super.initState();
    getToken();
  }



  @override
  Widget build(BuildContext context) {
    print("this is mobile=====>${widget.mobile}");
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemes.primaryColor,
        centerTitle: true,
        title: Text("Verification"),
      ),
      backgroundColor:
          isDark ? Colors.black : AppThemes.lightTextFieldBackGroundColor,
      body: SafeArea(
        child: Column(
          children: [

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: isDark
                        ? AppThemes.DarkModeColor
                        : AppThemes.lightWhiteBackGroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: SingleChildScrollView(
                  child: Container(
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height - 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Text("Enter Verification Code",style: TextStyle(
                          color: AppThemes.lightBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("+91${widget.mobile}",
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                              color: AppThemes.lightBlackColor
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("OTP :",style: TextStyle(color: AppThemes.lightBlackColor,fontWeight: FontWeight.bold),),
                            Text("${widget.newOtp}",style: TextStyle(color: AppThemes.lightBlackColor,fontWeight: FontWeight.normal),),

                          ],
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Container(
                            child: Form(
                          key: _con.formKey,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 02),
                              child: PinCodeFields(
                                controller: pinputController,
                                length: 4,
                                fieldBorderStyle: FieldBorderStyle.square,
                                responsive: false,
                                fieldHeight: 50.0,
                                fieldWidth: 60.0,
                                borderWidth: 1.0,
                                activeBorderColor: AppThemes.lightTextGreyColor,
                                //activeBackgroundColor: AppThemes.lightTextGreyColor,
                                borderColor: AppThemes.lightTextGreyColor,
                                borderRadius: BorderRadius.circular(10.0),
                                keyboardType: TextInputType.number,
                                autoHideKeyboard: false,
                                //fieldBackgroundColor: AppThemes.lightTextGreyColor,
                                textStyle: TextStyle(color: AppThemes.lightBlackColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.normal,
                                ),
                                onComplete: (String output) {
                                  if(widget.newOtp == pinputController.text){
                                  }else{
                                    final snackBar = SnackBar(
                                      content: const Text('Invalid OTP'),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                                  // Your logic with pin code
                                  print( output);
                                },
                              ),

//                               PinCodeTextField(
//                                 controller:pinputController,
//                                 appContext: context,
//                                 errorTextMargin: EdgeInsets.only(
//                                     left:
//                                         MediaQuery.of(context).padding.top * 2),
//                                 errorTextSpace: 30,
//                                 pastedTextStyle: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 length: 4,
//
//                                 obscureText: false,
//                                 obscuringCharacter: '*',
//                                 blinkWhenObscuring: true,
//                                 animationType: AnimationType.fade,
// //                                  validator: (v) {
// //                                    if (v.length < 3) {
// //                                      return "I'm from validator";
// //                                    } else {
// //                                      return null;
// //                                    }
// //                                  },
//                                 pinTheme: PinTheme(
//                                   shape: PinCodeFieldShape.box,
//                                   borderRadius: BorderRadius.circular(5),
//                                   fieldHeight: 50,
//                                   fieldWidth: 50,
//                                   activeFillColor: _con.hasError
//                                       ? Colors.orange
//                                       : Colors.white,
//                                   selectedColor: isDark
//                                       ? AppThemes.lightGreyColor
//                                       : AppThemes.lightGreyColor,
//                                   activeColor: isDark
//                                       ? AppThemes.lightGreyColor
//                                       : AppThemes.lightGreyColor,
//                                   inactiveColor: isDark
//                                       ? AppThemes.lightGreyColor
//                                       : AppThemes.lightGreyColor,
//                                   disabledColor: isDark
//                                       ? AppThemes.lightGreyColor
//                                       : AppThemes.lightGreyColor,
//                                   inactiveFillColor: isDark
//                                       ? AppThemes.lightGreyColor
//                                       : AppThemes.lightGreyColor,
//                                   selectedFillColor: isDark
//                                       ? AppThemes.lightGreyColor
//                                       : AppThemes.lightGreyColor,
//                                 ),
//
//                                 cursorColor: isDark
//                                     ? AppThemes.lightTextFieldBackGroundColor
//                                     : AppThemes.lightTextColor,
//                                 animationDuration: Duration(milliseconds: 300),
//
//                                 keyboardType: TextInputType.number,
//                                 onCompleted: (v) {
//                                   print("Completed");
//                                 },
//                                 validator: (value) {
//                                   if (value!.isEmpty) {
//                                     return getTranslator(
//                                         'Please enter correct code');
//                                   }
//                                   return null;
//                                 },
//                                 onChanged: (value) {
//                                   print(value);
//                                   setState(() {
//                                     _con.currentText = value;
//                                   });
//                                 },
//                                 beforeTextPaste: (text) {
//                                   print("Allowing to paste $text");
//                                   //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
//                                   //but you can show anything you want here, like your pop up saying wrong paste format or etc
//                                   return true;
//                                 },
//                               )

                          ),
                        )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),

                        InkWell(
                          onTap: (){
                            verifyOtp();
                          },
                          child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppThemes.primaryColor
                            ),
                            child: Center(
                              child: Text("OTP Verify",style: TextStyle(
                                color: AppThemes.lightWhiteColor,fontWeight: FontWeight.bold
                              ),),
                            ),
                          ),
                        ),
                        // CommonRaisedButton(
                        //   title: getTranslator("confirm"),
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal:
                        //           MediaQuery.of(context).size.width * 0.15,
                        //       vertical: 18),
                        //   onPressed: () {
                        //     verifyOtp();
                        //
                        //     // widget.isSignUp
                        //     //     ? Get.off(DashBoardScreen())
                        //     //     : Get.off(NewPasswordScreen());
                        //
                        //     // ignore: todo
                        //     //TODO: Make OTP from boxes.
                        //   },
                        // ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              getTranslator("did_not_get_code_yet"),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              getTranslator("resend"),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                  fontSize: 13, fontWeight: FontWeight.bold,color: AppThemes.primaryColor),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        // CommonWhiteButton(
                        //   onPressed: () {},
                        //   title: getTranslator("resend"),
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: 35, vertical: 15),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
