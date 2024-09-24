import 'package:get/get.dart';
import 'package:plate_perks/utils/middlewares/auth_middlewares.dart';
import 'package:plate_perks/utils/static/routes.dart';
import 'package:plate_perks/views/auth/forgot_password_screen.dart';
import 'package:plate_perks/views/auth/login_screen.dart';
import 'package:plate_perks/views/auth/signup_screen.dart';
import 'package:plate_perks/views/auth/verify_code_screen.dart';
import 'package:plate_perks/views/main/main_page.dart';
import 'package:plate_perks/views/main/search_screen.dart';
import 'package:plate_perks/views/start/on_boarding.dart';
import 'package:plate_perks/views/start/splash_screen.dart';

List<GetPage<dynamic>> pages = [

  // GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
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
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(name: AppRoutes.signup, page: () => const SignupScreen(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 400)),
  GetPage(name: AppRoutes.forgotPass, page: () => const ForgotPasswordScreen(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 400)),
  GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCodeScreen(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 400)),



];
