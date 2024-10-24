import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/core/controllers/starter/food_controller.dart';
import 'package:plate_perks/core/controllers/starter/restaurant_controller.dart';
import 'package:plate_perks/core/controllers/settings/language_controller.dart';
import 'package:plate_perks/core/services/app_services.dart';
import 'package:plate_perks/core/services/init_herlper.dart';
import 'package:plate_perks/end_point.dart';
import 'package:plate_perks/utils/static/app_translations.dart';
import 'package:plate_perks/utils/static/pages.dart';
import 'package:plate_perks/utils/styles/en_theme.dart';
import 'package:plate_perks/views/start/splash_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initHelper();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // amlp-55-14%55#
    // amrelnemr6@example.com
    Get.find<RestaurantController>().getAllRestaurantData();
    Get.find<FoodController>().getAllFoodData();
    final lController = Get.find<LanguageController>();
    return GetMaterialApp(
      locale: lController.changeLanguage("tr"),
      debugShowCheckedModeBanner: false,
      translations: AppTranslation(),
      title: 'Plate Perks',
      theme: enTheme,
      // home: const SplashScreen(),
      getPages: pages,
    );
  }
}
