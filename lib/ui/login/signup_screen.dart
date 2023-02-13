import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:milk/constants/app_themes.dart';
import 'package:milk/constants/display_formates.dart';
import 'package:milk/constants/urls.dart';
import 'package:milk/controllers/login_controller.dart';
import 'package:milk/ui/component/component.dart';
import 'package:milk/ui/dashboard/dashboard.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../constants/messages/session.dart';
import 'package:http/http.dart'as http;
import 'login.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends StateMVC<SignUpScreen> {
  late LoginController _con;
  TextEditingController mobileController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  _SignUpScreenState() : super(LoginController()) {
    _con = controller as LoginController;


  }

  getSignUp() async {
    var request = http.MultipartRequest('POST', Uri.parse('${Urls.baseUrl}registration.php'));
    request.fields.addAll({
      'user': '${nameController.text.toString()}',
      'mobile': '${mobileController.text.toString()}',
      'email':  '${emailController.text}',
    });
    print("###############################${request.fields}");
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print("this is response =>>>>${response.statusCode}");
      final result = await response.stream.bytesToString();
      var finalData = json.decode(result);

      Fluttertoast.showToast(msg: "${finalData['ResponseMsg']}");

      setState(() {
        nameController.clear();
        emailController.clear();
        mobileController.clear();
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignInScreen()));

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
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  TitleTextView(title: getTranslator("Sign Up")),

                  SizedBox(
                    height: 50,
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
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              // border: InputBorder.none,
                              hintText: getTranslator("Full Name"),
                            ),
                            validator: (v){
                              if(v!.isEmpty){
                                return "Name is required";
                              }
                            },
                          ),

                        )

                    ),
                  ),
                  SizedBox(
                    height: 15
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(10),
                        //   color: AppThemes.lightGrey.withOpacity(0.2)
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
                                //labelText: "Name",
                                labelStyle: Theme.of(context).textTheme.headline5?.copyWith(
                                    fontSize: 13,
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
                            //     validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return getTranslator('this_field_required');
                            //   }
                            //   return null;
                            // }
                          ),

                        )

                        // commonFloatingFormField(
                        //     context, getTranslator("Full Name"),
                        //     // maxLength: 10,
                        //
                        //     controller: nameController,
                        //     // floatingHint: FloatingLabelBehavior.auto,
                        //     keyboardType: TextInputType.name,
                        //   validator: (v){
                        //     if(v!.isEmpty){
                        //       return "Name is required";
                        //     }
                        //   },
                        // //     validator: (value) {
                        // //   if (value!.isEmpty) {
                        // //     return getTranslator('this_field_required');
                        // //   }
                        // //   return null;
                        // // }
                        // ),
                      ),
                    ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20,),
                    child: Container(
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     color: AppThemes.lightGrey.withOpacity(0.2)
                        // ),

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: emailController,
                            // floatingHint: FloatingLabelBehavior.auto,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              // border: InputBorder.none
                                border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),

                              //labelText: "Name",
                              // labelStyle: Theme.of(context).textTheme.headline5?.copyWith(
                              //     fontSize: 13,
                              //     color: AppThemes.lightWhiteColor,
                              //     fontWeight: FontWeight.w500),
                              hintText: "Email Id",
                            ),
                            validator: (v){
                              if(v!.isEmpty){
                                return "Email Id is required";
                              }
                              if(!v.contains("@")){
                                return "Enter Valid Email Id";
                              }
                            },
                            //     validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return getTranslator('this_field_required');
                            //   }
                            //   return null;
                            // }
                          ),

                        )

                      // commonFloatingFormField(
                      //     context, getTranslator("Full Name"),
                      //     // maxLength: 10,
                      //
                      //     controller: nameController,
                      //     // floatingHint: FloatingLabelBehavior.auto,
                      //     keyboardType: TextInputType.name,
                      //   validator: (v){
                      //     if(v!.isEmpty){
                      //       return "Name is required";
                      //     }
                      //   },
                      // //     validator: (value) {
                      // //   if (value!.isEmpty) {
                      // //     return getTranslator('this_field_required');
                      // //   }
                      // //   return null;
                      // // }
                      // ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  CommonRaisedButton(
                    title: getTranslator("sign_up"),
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.16,
                        vertical: 18),
                    onPressed: () {
                      if(_con.formKey.currentState!.validate()){
                        getSignUp();
                      }
                      else{
                        Fluttertoast.showToast(msg: "All Fields are required");
                      }
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.065,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        getTranslator("already_have_account"),
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                      InkWell(
                        onTap: (){
                          loginTabController.animateTo(1);
                        },
                        child: Text(
                          getTranslator("sign_in"),
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontSize: 13, fontWeight: FontWeight.bold,color: AppThemes.primaryColor),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  // CommonWhiteButton(
                  //   onPressed: () {
                  //     loginTabController.animateTo(1);
                  //   },
                  //   title: getTranslator("sign_in"),
                  //   padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

