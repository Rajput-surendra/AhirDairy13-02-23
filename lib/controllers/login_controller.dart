import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class LoginController extends ControllerMVC {
  late  final formKey = GlobalKey<FormState>();
  bool agreeTNP = false;

  LoginController();
}
