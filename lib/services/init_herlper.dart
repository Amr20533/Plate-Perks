import 'package:get/get.dart';
import 'package:plate_perks/controllers/starter/food_controller.dart';
import 'package:plate_perks/controllers/starter/main_page_controller.dart';
import 'package:plate_perks/controllers/starter/recent_controller.dart';
import 'package:plate_perks/controllers/starter/restaurant_controller.dart';
import 'package:plate_perks/controllers/settings/language_controller.dart';
import 'package:plate_perks/controllers/starter/search_controller.dart';
import 'package:plate_perks/dependencies/api_helper.dart';
import 'package:plate_perks/end_point.dart';
import 'package:plate_perks/repositories/food_repositories.dart';
import 'package:plate_perks/repositories/recent_repository.dart';
import 'package:plate_perks/repositories/restaurant_repository.dart';
import 'package:plate_perks/repositories/search_repository.dart';

import 'app_services.dart';

initHelper()async{

  Get.lazyPut(() => MainPageController());
  Get.putAsync(() => AppServices().init());
  Get.lazyPut(() => LanguageController());

  Get.lazyPut(()=>ApiHelper(
    appBaseUrl: AppEndPoint.server,
  ));
  /// Repositories
  Get.lazyPut(()=>RestaurantRepo(
    apiHelper: Get.find(),
  ));
  Get.lazyPut(()=>FoodRepo(
    apiHelper: Get.find(),
  ));

  Get.lazyPut(()=>RecentRepo(
    apiHelper: Get.find(),
  ));
  Get.lazyPut(()=>SearchRepo(
    apiHelper: Get.find(),
  ));



  Get.lazyPut(() => RestaurantController(
    restaurantRepo: Get.find(),
  ));

  Get.lazyPut(() => FoodController(foodRepo: Get.find()));
  Get.lazyPut(() => RecentController(recentRepo: Get.find()));
  Get.lazyPut(() => SearchPageController(
    searchRepo: Get.find()
  ));



}