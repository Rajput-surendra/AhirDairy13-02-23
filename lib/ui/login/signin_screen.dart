import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:milk/constants/constants.dart';
import 'package:milk/controllers/login_controller.dart';
import 'package:milk/ui/component/component.dart';
import 'package:milk/ui/dashboard/dashboard.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:http/http.dart'as http;

import 'login.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends StateMVC<SignInScreen> {
  late LoginController _con;

  _SignInScreenState() : super(LoginController()) {
    _con = controller as LoginController;
  }
  TextEditingController mobileController  = TextEditingController();
  var newOtp;
  var mobile;
  sendOtp() async {
    var request = http.MultipartRequest('POST', Uri.parse('${Urls.baseUrl}send_otp.php'));
    request.fields.addAll({
      'mobile': '${mobileController.text.toString()}'
    });
    print("this is a request++++++>>${request.fields}");
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print("this is response =>>>>${response.statusCode}");
      final result = await response.stream.bytesToString();
      var finalData = json.decode(result);
      print("this is A final Data===>${finalData}");
        print("this is a Otp====>${finalData['OTP']}");
        setState(() {
          newOtp = finalData['OTP'];
        });
      print("this is a Otp====>}");
         if(finalData['ResponseCode'] == '200') {
           Fluttertoast.showToast(msg: "${finalData['ResponseMsg']}");
           print("this is a mobile===>111111${mobileController.text}");
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VerificationScreen(newOtp: newOtp.toString(), mobile: mobileController.text.toString())));
         }else{
           Fluttertoast.showToast(msg: "${finalData['ResponseMsg']}");
         }
      setState(() {
        //mobileController.clear();
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
      backgroundColor:
          isDark ? Colors.black : AppThemes.lightTextFieldBackGroundColor,
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                color: isDark
                    ? AppThemes.DarkModeColor
                    : AppThemes.lightWhiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 60),
            child: Form(
              key: _con.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  TitleTextView(title: getTranslator("Sign In")),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     color: AppThemes.lightGrey.withOpacity(0.2)
                        // ),

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            maxLength: 10,
                            controller: mobileController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              counterText: "",
                              // border: InputBorder.none,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: Theme.of(context).textTheme.headline5?.copyWith(
                                  fontSize: 12,
                                  color: AppThemes.lightWhiteColor,
                                  fontWeight: FontWeight.w500),
                              hintText: "Mobile No",

                            ),
                            validator: (v){
                              if(v!.isEmpty){
                                return "Mobile No is required";
                              }
                              if(v.length != 10){
                                return "Mobile Number must be of 10 digit";
                              }
                            },

                          ),

                        )

                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),

              InkWell(
                onTap: (){
                  if(_con.formKey.currentState!.validate()){
                    sendOtp();
                  }
                  else{
                    Fluttertoast.showToast(msg: "Mobile No is  required");
                  }
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppThemes.primaryColor
                  ),
                  child: Center(
                    child: Text("Send OTP ",style: TextStyle(
                        color: AppThemes.lightWhiteColor,fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
                  // CommonRaisedButton(
                  //   title:
                  //   padding: EdgeInsets.symmetric(
                  //       horizontal: MediaQuery.of(context).size.width * 0.16,
                  //       vertical: 18),
                  //   onPressed: () {
                  //  if(_con.formKey.currentState!.validate()){
                  //       sendOtp();
                  //     }
                  //     else{
                  //       Fluttertoast.showToast(msg: "Mobile No is  required");
                  //     }
                  //   },
                  // ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        getTranslator("not_have_account_yet"),
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                      InkWell(
                        onTap: (){
                          loginTabController.animateTo(0);
                        },
                        child: Text(
                          getTranslator("sign_up"),
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(fontSize: 13, fontWeight: FontWeight.bold,color:AppThemes.primaryColor),
                        ),
                      ),

                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
