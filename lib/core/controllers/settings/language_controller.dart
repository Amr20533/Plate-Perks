
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plate_perks/core/services/app_services.dart';
import 'package:plate_perks/end_point.dart';
import 'package:plate_perks/utils/styles/ar_theme.dart';
import 'package:plate_perks/utils/styles/en_theme.dart';

class LanguageController extends GetxController{
  Locale language = Locale(Get.deviceLocale!.languageCode);
  GetStorage getStorage = GetStorage();
  ThemeData appTheme = enTheme;
  RxString selectedLanguage = ''.obs;

  // void selectLanguage(String newLang) {
  //   selectedLanguage.value = newLang;
  //   changeLanguage(newLang);
  // }


  void selectLanguage(String newLang){
    selectedLanguage.value = newLang;
  }

  void changeLanguage(String newLang) {
    getStorage.remove(AppEndPoint.language);

    // Change the language and update the storage
    getStorage.write(AppEndPoint.language, newLang);

    // Update the Locale based on selected language
    Locale locale = Locale(newLang);
    Get.updateLocale(locale);

    // Update theme based on language
    appTheme = (newLang == 'ar') ? arTheme : enTheme;
    Get.changeTheme(appTheme);

    // Update the selectedLanguage
    selectedLanguage.value = newLang; // Update selectedLanguage to reflect the new language
  }

  @override
  void onInit() {
    super.onInit();

    Map<String, Locale> langToLocale = {
      "ar": const Locale("ar"),
      "en": const Locale("en"),
      "tr": const Locale("tr"),
      "de": const Locale("de"),
      "it": const Locale("it"),
      "fr": const Locale("fr"),
    };

    // Get saved language from storage (if available)
    String? sharedLang = getStorage.read(AppEndPoint.language);
    debugPrint("sharedLang : $sharedLang");

    if (langToLocale.containsKey(sharedLang)) {
      selectedLanguage.value = sharedLang!;
      language = langToLocale[sharedLang]!; // Update locale with selected language
    } else {
      // If no shared language, fallback to device language or default language
      selectedLanguage.value = Get.deviceLocale!.languageCode;
      language = Locale(Get.deviceLocale!.languageCode);
    }

    appTheme = (selectedLanguage.value == "ar") ? arTheme : enTheme;

    // Initialize the language and theme based on selected language
    debugPrint("Initial selected language: ${selectedLanguage.value}");
  }

}