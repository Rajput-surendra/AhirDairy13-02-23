import 'package:flutter/material.dart';
import 'package:milk/constants/constants.dart';
import 'package:milk/ui/component/component.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final infoFormKey = GlobalKey<FormState>();
  final changePassFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemes.primaryColor,
        centerTitle: true,
        title:Text(getTranslator("edit_profile"))
      ),
      backgroundColor:
          isDark ? Colors.black : AppThemes.lightTextFieldBackGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // CommonAppBar(title: getTranslator("edit_profile")),
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
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 85.0,
                                  width: 85.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: isDark
                                            ? Colors.white.withOpacity(0.1)
                                            : Colors.grey.withOpacity(0.4),
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
                              Spacer(),
                              InkWell(
                                onTap: () {},
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  child: Container(
                                    color: isDark
                                        ? AppThemes.smoothBlack
                                        : AppThemes
                                            .lightTextFieldBackGroundColor,
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Form(
                          key: infoFormKey,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: commonFloatingFormField(
                                    context, getTranslator("nick_name"),
                                    floatingHint: FloatingLabelBehavior.auto,
                                    onSaved: (value) {}, validator: (value) {
                                  if (value!.isEmpty) {
                                    return getTranslator('this_field_required');
                                  }
                                  return null;
                                }),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: commonFloatingFormField(
                                    context, getTranslator("delivery_address"),
                                    floatingHint: FloatingLabelBehavior.auto,
                                    onSaved: (value) {}, validator: (value) {
                                  if (value!.isEmpty) {
                                    return getTranslator('this_field_required');
                                  }
                                  return null;
                                }),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: commonFloatingFormField(
                                    context, getTranslator("phone_number"),
                                    floatingHint: FloatingLabelBehavior.auto,
                                    onSaved: (value) {},
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                  if (value!.isEmpty) {
                                    return getTranslator('this_field_required');
                                  }
                                  return null;
                                }),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CommonRaisedButton(
                          title: getTranslator("save_changes"),
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.15,
                              vertical: 18),
                          onPressed: () {
                            if (infoFormKey.currentState!.validate()) {}
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Form(
                          key: changePassFormKey,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: commonFloatingFormField(
                                    context, getTranslator("current_password"),
                                    isObscureText: true,
                                    floatingHint: FloatingLabelBehavior.auto,
                                    onSaved: (value) {}, validator: (value) {
                                  if (value!.isEmpty) {
                                    return getTranslator('this_field_required');
                                  }
                                  return null;
                                }),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: commonFloatingFormField(
                                    context, getTranslator("new_password"),
                                    isObscureText: true,
                                    floatingHint: FloatingLabelBehavior.auto,
                                    onSaved: (value) {}, validator: (value) {
                                  if (value!.isEmpty) {
                                    return getTranslator('this_field_required');
                                  }
                                  return null;
                                }),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CommonRaisedButton(
                          title: getTranslator("change_password"),
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.15,
                              vertical: 18),
                          onPressed: () {
                            if (changePassFormKey.currentState!.validate()) {}
                          },
                        ),
                        SizedBox(
                          height: 25,
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
