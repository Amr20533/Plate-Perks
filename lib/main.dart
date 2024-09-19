import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/controllers/restaurant_controller.dart';
import 'package:plate_perks/controllers/settings/language_controller.dart';
import 'package:plate_perks/services/init_herlper.dart';
import 'package:plate_perks/utils/static/app_translations.dart';
import 'package:plate_perks/utils/styles/en_theme.dart';
import 'package:plate_perks/views/main/main_page.dart';

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
    final lController = Get.find<LanguageController>();
    return GetMaterialApp(
      locale: lController.language,
      debugShowCheckedModeBanner: false,
      translations: AppTranslation(),
      title: 'Plate Perks',
      theme: enTheme,
      home: const MainPage(),
    );
  }
}
