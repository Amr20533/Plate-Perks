import 'package:get/get.dart';
import 'package:plate_perks/components/features/favorites/favorite_controller.dart';
import 'package:plate_perks/core/controllers/auth/forgot_password_controller.dart';
import 'package:plate_perks/core/controllers/auth/login_controller.dart';
import 'package:plate_perks/core/controllers/auth/sign_up_controller.dart';
import 'package:plate_perks/core/controllers/auth/verify_code_controller.dart';
import 'package:plate_perks/core/controllers/features/cart_controller.dart';
import 'package:plate_perks/core/controllers/starter/food_controller.dart';
import 'package:plate_perks/core/controllers/starter/main_page_controller.dart';
import 'package:plate_perks/core/controllers/starter/recent_controller.dart';
import 'package:plate_perks/core/controllers/starter/restaurant_controller.dart';
import 'package:plate_perks/core/controllers/settings/language_controller.dart';
import 'package:plate_perks/core/controllers/starter/search_controller.dart';
import 'package:plate_perks/core/dependencies/api_helper.dart';
import 'package:plate_perks/core/repositories/auth/login_repository.dart';
import 'package:plate_perks/core/repositories/features/favorite_repo.dart';
import 'package:plate_perks/end_point.dart';
import 'package:plate_perks/core/repositories/food_repositories.dart';
import 'package:plate_perks/core/repositories/recent_repository.dart';
import 'package:plate_perks/core/repositories/restaurant_repository.dart';
import 'package:plate_perks/core/repositories/search_repository.dart';

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

  Get.lazyPut(()=>LoginRepo(
    apiHelper: Get.find(),
  ));

  Get.lazyPut(()=> FavoriteRepo(
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
  Get.lazyPut(() => CartController());


  /// ************************** Auth Controllers *************************
  // Get.put(SignupController());
  Get.lazyPut(() => SignupController());
  Get.lazyPut(() => LoginController(loginRepo: Get.find(), appServices: Get.find(), ));
  Get.lazyPut(() => ForgotPasswordController());
  Get.lazyPut(() => VerifyCodeController());



  /// ************************** Feature Controllers *************************
  Get.lazyPut(() => FavoriteController(appServices: Get.find(), favoriteRepo: Get.find()));




}