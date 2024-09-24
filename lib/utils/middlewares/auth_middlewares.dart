import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/core/services/app_services.dart';
import 'package:plate_perks/end_point.dart';
import 'package:plate_perks/utils/static/routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    bool isAuthenticated = checkUserAuthentication();

    if (!isAuthenticated) {
      return const RouteSettings(name: AppRoutes.login);
    }else{
      return const RouteSettings(name: AppRoutes.main);
    }
  }

  bool checkUserAuthentication() {
    AppServices appServices = Get.find();
    if (appServices.getStorage.read(AppEndPoint.userToken).toString().isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}