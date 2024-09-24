
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController{
  late Locale language;
  // ThemeData appTheme = eTheme;

  changeLanguage(String newLang){
    Locale locale = Locale(newLang);
    // appServices.sharedPreferences.setString("lang", newLang);
    Get.updateLocale(locale);
    // appTheme = newLang == 'ar' ? aTheme : eTheme;
    // Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {

    // String? sharedLang = appServices.sharedPreferences.getString("lang");
    // if(sharedLang == "ar"){
    //   language =  const Locale("ar");
    //   // appTheme = aTheme;
    // }else if(sharedLang == "en"){
    //   language =  const Locale("en");
    //   // appTheme = eTheme;
    // }else{
    //   language = Locale(Get.deviceLocale!.languageCode);
    //   // appTheme = eTheme;

      language = Locale(Get.deviceLocale!.languageCode);

      super.onInit();
  }

}