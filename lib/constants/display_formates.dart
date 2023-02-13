import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:intl/intl.dart';

String getTranslator(String key) {
  try {
    return key.tr;
  } catch (e) {
    return "";
  }
}

final ddMMMYYYYFormat = new DateFormat('dd MMM yyyy');
