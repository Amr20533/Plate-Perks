import 'package:get/get.dart';
import 'package:plate_perks/controllers/main_page_controller.dart';
import 'package:plate_perks/controllers/restaurant_controller.dart';
import 'package:plate_perks/controllers/settings/language_controller.dart';
import 'package:plate_perks/dependencies/api_helper.dart';
import 'package:plate_perks/end_point.dart';
import 'package:plate_perks/repositories/restaurant_repository.dart';

initHelper()async{

  Get.lazyPut(() => MainPageController());
  Get.lazyPut(() => LanguageController());

  Get.lazyPut(()=>ApiHelper(
    appBaseUrl: AppEndPoint.server,
  ));
  /// Repositories
  Get.lazyPut(()=>RestaurantRepo(
    apiHelper: Get.find(),
  ));



  Get.lazyPut(() => RestaurantController(
    restaurantRepo: Get.find(),
  ));



}