import 'package:get/get.dart';
import 'package:plate_perks/core/controllers/auth/login_controller.dart';
import 'package:plate_perks/core/controllers/auth/sign_up_controller.dart';
import 'package:plate_perks/core/controllers/features/cart_controller.dart';
import 'package:plate_perks/core/controllers/features/favorite_controller.dart';
import 'package:plate_perks/core/controllers/features/order_controller.dart';
import 'package:plate_perks/core/controllers/settings/profile_controller.dart';
import 'package:plate_perks/core/controllers/starter/food_controller.dart';
import 'package:plate_perks/utils/middlewares/auth_middlewares.dart';
import 'package:plate_perks/utils/static/routes.dart';
import 'package:plate_perks/views/auth/forgot_password_screen.dart';
import 'package:plate_perks/views/auth/login_screen.dart';
import 'package:plate_perks/views/auth/signup_screen.dart';
import 'package:plate_perks/views/auth/verify_code_screen.dart';
import 'package:plate_perks/views/main/main_page.dart';
import 'package:plate_perks/views/main/search_screen.dart';
import 'package:plate_perks/views/settings/account_settings.dart';
import 'package:plate_perks/views/settings/cart_page.dart';
import 'package:plate_perks/views/settings/edit_profile.dart';
import 'package:plate_perks/views/settings/favorites_page.dart';
import 'package:plate_perks/views/settings/help_page.dart';
import 'package:plate_perks/views/settings/language_settings.dart';
import 'package:plate_perks/views/settings/notification_settings.dart';
import 'package:plate_perks/views/settings/order/checkout/checkout_failed.dart';
import 'package:plate_perks/views/settings/order/checkout/checkuot_success.dart';
import 'package:plate_perks/views/settings/order/create_order_page.dart';
import 'package:plate_perks/views/settings/order/order_details.dart';
import 'package:plate_perks/views/settings/order/order_page.dart';
import 'package:plate_perks/views/settings/privacy_page.dart';
import 'package:plate_perks/views/settings/rating_app_page.dart';
import 'package:plate_perks/views/settings/services_page.dart';
import 'package:plate_perks/views/settings/update_password.dart';
import 'package:plate_perks/views/start/on_boarding.dart';
import 'package:plate_perks/views/start/splash_screen.dart';

List<GetPage<dynamic>> pages = [

  GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
  GetPage(name: AppRoutes.onBoarding, page: () {
    return const OnBoardingScreen();
  },
      // middlewares: [
      // ],
      transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 400)),
  GetPage(name: AppRoutes.main, page: () => const MainPage(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(name: AppRoutes.search, page: () => const SearchScreen(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 400)),
  GetPage(name: AppRoutes.login, page: () => const LoginScreen(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 400),
      binding: BindingsBuilder(()=> Get.lazyPut(() => LoginController(loginRepo: Get.find(), appServices: Get.find()))),
      middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(name: AppRoutes.signup, page: () => const SignupScreen(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 400),
  binding: BindingsBuilder(()=> Get.lazyPut(() => SignupController(signupRepo: Get.find())))
  ),
  GetPage(name: AppRoutes.forgotPass, page: () => const ForgotPasswordScreen(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 400)),
  GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCodeScreen(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 400)),
/// >>>>>>>>>>>>>>>>>>>>>>>> Settings Routes <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  GetPage(name: AppRoutes.editProfile, page: () => const EditProfile(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 400)),
  GetPage(name: AppRoutes.updatePassword, page: () => const UpdatePassword(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 400)),
  GetPage(name: AppRoutes.accountSettings, page: () => const AccountSettings(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 400)),
  GetPage(name: AppRoutes.notification, page: () => const NotificationSettings(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 400)),
  GetPage(name: AppRoutes.privacy, page: () => const PrivacyPage(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 400)),
  GetPage(name: AppRoutes.favorites, page: () => const FavoritesPage(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 400),
  binding: BindingsBuilder((){
    Get.find<FavoriteController>();
    Get.find<FoodController>();
  })
  ),
  GetPage(name: AppRoutes.help, page: () => const HelpPage(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 400)),
  GetPage(name: AppRoutes.cart, page: () {
    return const CartPage();
  }, transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 400),
  binding: BindingsBuilder(() {
    Get.lazyPut(() => CartController(cartRepo: Get.find(), appServices: Get.find()));
    Get.put<FoodController>(FoodController(foodRepo: Get.find()));
  })
  ),


  GetPage(name: AppRoutes.orders, page: () {
    return const OrderPage();
  }, transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 400),
  binding: BindingsBuilder(() {
    Get.put<OrderController>(OrderController(orderRepo: Get.find(), appServices: Get.find()));
    Get.put<FoodController>(FoodController(foodRepo: Get.find()));
  })
  ),

  GetPage(name: AppRoutes.orderDetail, page: () {
    final OrderDetails orderDetails = Get.arguments;
    return orderDetails;
  }, transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 400),
  binding: BindingsBuilder(() {
    Get.put<OrderController>(OrderController(orderRepo: Get.find(), appServices: Get.find()));
    Get.put<FoodController>(FoodController(foodRepo: Get.find()));
  })
  ),


  GetPage(name: AppRoutes.createOrder, page: () {
    final CreateOrderPage orderPage = Get.arguments;
    return orderPage;
  }, transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 400),
  binding: BindingsBuilder(() {
    Get.put<OrderController>(OrderController(orderRepo: Get.find(), appServices: Get.find()));
    Get.put<ProfileController>(ProfileController(profileRepo: Get.find(), appServices: Get.find()));
    Get.lazyPut(() => CartController(cartRepo: Get.find(), appServices: Get.find()));
    Get.put<FoodController>(FoodController(foodRepo: Get.find()));
  })
  ),


  GetPage(name: AppRoutes.giveRating, page: () => const RatingAppPage(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 400)),
  GetPage(name: AppRoutes.services, page: () => const ServicesPage(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 400)),
  GetPage(name: AppRoutes.language, page: () => const LanguageSettings(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 400)),

  /// >>>>>>>>>>>>>>>>>>>>>>>> Order <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  GetPage(name: AppRoutes.checkoutSuccess, page: () => const CheckoutSuccess(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 400)),
  GetPage(name: AppRoutes.checkoutFailed, page: () => const CheckoutFailed(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 400)),

];
