import 'package:flutter/material.dart';
import 'package:milk/constants/constants.dart';
import 'package:milk/ui/component/component.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final contactFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor:
          isDark ? Colors.black : AppThemes.lightTextFieldBackGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            CommonAppBar(title: getTranslator("contact_us")),
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
                        TitleTextView(title: getTranslator("get_in_touch")),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  getTranslator("contact_us_instruction"),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(fontSize: 15, height: 1.5),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Form(
                          key: contactFormKey,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: commonFloatingFormField(
                                    context, getTranslator("subject"),
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
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: isDark
                                              ? AppThemes.smoothBlack
                                              : AppThemes
                                                  .lightTextFieldBackGroundColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 15, bottom: 10),
                                          child: Center(
                                            child: TextFormField(
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5!
                                                  .copyWith(fontSize: 15),
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                labelStyle: Theme.of(context)
                                                    .textTheme
                                                    .headline3!
                                                    .copyWith(
                                                        fontSize: 16,
                                                        color: AppThemes
                                                            .lightTextGreyColor),
                                                hintText:
                                                    getTranslator("message"),
                                                counterText: "",
                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return getTranslator(
                                                      'this_field_required');
                                                }
                                                return null;
                                              },
                                              onSaved: (value) {},
                                              maxLines: 6,
                                            ),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.1,
                        ),
                        CommonRaisedButton(
                          title: getTranslator("send"),
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.15,
                              vertical: 18),
                          onPressed: () {
                            if (contactFormKey.currentState!.validate()) {}
                          },
                        ),
                        SizedBox(
                          height: 20,
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
