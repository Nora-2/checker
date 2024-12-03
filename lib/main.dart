import 'package:checker/core/utilis/localization/language.dart';
import 'package:checker/core/utilis/localization/localcontroller.dart';
import 'package:flutter/material.dart';
import 'package:checker/welcome.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
 SharedPreferences?sharedpref;
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedpref=await SharedPreferences.getInstance();
  await Permission.camera.request();
  runApp(const checker());
}

// ignore: camel_case_types
class checker extends StatelessWidget {
  const checker({super.key});

  @override
  Widget build(BuildContext context) {
 Localcontroller controller=  Get.put(Localcontroller());
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(), // Your translations
      locale: controller.initialLang.value, // Initial locale
      fallbackLocale: const Locale('en'),
      home:const Welcomepage(),
    );
  }
}
