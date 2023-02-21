import 'package:flutter/material.dart';

class Utils {
  static navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  static String formatPhone(String phoneInput) {
    return phoneInput.substring(1);
  }
}
