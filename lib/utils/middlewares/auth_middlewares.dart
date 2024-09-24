import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/core/services/app_services.dart';
import 'package:plate_perks/end_point.dart';
import 'package:plate_perks/utils/static/routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    bool isAuthenticated = checkUserAuthentication();

    if (isAuthenticated ) {
      return const RouteSettings(name: AppRoutes.main);
    }
    return null;
  }

  bool checkUserAuthentication() {
    AppServices appServices = Get.find();
    // Check if the user token exists and is valid
    return appServices.getStorage.read(AppEndPoint.userToken) != null;
  }
}

