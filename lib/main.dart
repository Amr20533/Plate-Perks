import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/core/controllers/starter/food_controller.dart';
import 'package:plate_perks/core/controllers/starter/restaurant_controller.dart';
import 'package:plate_perks/core/controllers/settings/language_controller.dart';
import 'package:plate_perks/core/services/init_herlper.dart';
import 'package:plate_perks/utils/static/app_translations.dart';
import 'package:plate_perks/utils/static/pages.dart';
import 'package:plate_perks/utils/styles/en_theme.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initHelper();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<RestaurantController>().getAllRestaurantData();
    Get.find<FoodController>().getAllFoodData();
    final lController = Get.find<LanguageController>();
    return GetMaterialApp(
      locale: lController.changeLanguage("tr"),
      debugShowCheckedModeBanner: false,
      translations: AppTranslation(),
      title: 'Plate Perks',
      theme: enTheme,
      // home: const OnBoardingScreen(),
      getPages: pages,
    );
  }
}
