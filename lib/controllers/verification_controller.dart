import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class VerificationController extends ControllerMVC {
  TextEditingController otpTextEditingController = TextEditingController();
  String otpdata = '';
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  VerificationController();
}
