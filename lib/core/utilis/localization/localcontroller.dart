import 'package:checker/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Localcontroller extends GetxController {
  // Define an observable variable for the initial language
  var initialLang = Locale('en').obs;

  Localcontroller() {
    // Set the initial language based on shared preferences
    String? langCode = sharedpref!.getString('lang');
    initialLang.value = langCode == 'ar' ? const Locale('ar') : const Locale('en');
  }

  void changeLanguage(String langCode) {
    var locale = Locale(langCode);
    sharedpref!.setString('lang', langCode);
    initialLang.value = locale; // Update the observable variable
    Get.updateLocale(locale); // Update the locale in GetX
  }
}