import 'package:get/get.dart';

class AppDimensions{
  static double screenWidth = Get.width;
  static double screenHeight = Get.height;

  static double getWidth(double pixels){
    double designWidth = 400;
    return (pixels * screenWidth)/ designWidth;
  }

  static double getHeight(double pixels){
    double designHeight = 820;
    return (pixels * screenHeight) / designHeight;
  }

}