import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milk/constants/constants.dart';
import 'package:milk/ui/component/component.dart';

import '../dashboard/dashboard_screen.dart';
import 'login.dart';

class NewPasswordScreen extends StatefulWidget {
  @override
  _NewPasswordScreenState createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor:
          isDark ? Colors.black : AppThemes.lightTextFieldBackGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            CommonAppBar(title: getTranslator("forgot_password")),
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
                        TitleTextView(
                            title: getTranslator("enter_new_password")),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Container(
                            child: Form(
                          key: formKey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 30),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: commonFloatingFormField(
                                      context, getTranslator("new_password"),
                                      isObscureText: true,
                                      floatingHint: FloatingLabelBehavior.auto,
                                      onSaved: (value) {}, validator: (value) {
                                    if (value!.isEmpty) {
                                      return getTranslator(
                                          'this_field_required');
                                    }
                                    return null;
                                  }),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 20),
                                  child: commonFloatingFormField(context,
                                      getTranslator("confirm_new_password"),
                                      isObscureText: true,
                                      floatingHint: FloatingLabelBehavior.auto,
                                      onSaved: (value) {}, validator: (value) {
                                    if (value!.isEmpty) {
                                      return getTranslator(
                                          'this_field_required');
                                    }
                                    return null;
                                  }),
                                ),
                              ],
                            ),
                          ),
                        )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        CommonRaisedButton(
                          title: getTranslator("save_password"),
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.07,
                              vertical: 18),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Get.off(DashBoardScreen());
                            }
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.16,
                        ),
                        Text(
                          getTranslator("remember_it"),
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        CommonWhiteButton(
                          onPressed: () {
                            Get.off(LoginDashboard());
                          },
                          title: getTranslator("sign_in"),
                          padding: EdgeInsets.symmetric(
                              horizontal: 35, vertical: 15),
                        ),
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
