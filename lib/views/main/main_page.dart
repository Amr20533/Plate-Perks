import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/core/controllers/starter/main_page_controller.dart';
import 'package:plate_perks/components/main/bottom_nav_icon.dart';
import 'package:plate_perks/components/main/custom_bottom_nav_bar.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(builder: (controller){
      return Scaffold(
        // appBar: AppBar(
        //
        // ),
        body: SafeArea(child: controller.screens[controller.currentIndex]),
        bottomNavigationBar: CustomBottomNavBar(mainController: controller),
      );
    });
  }
}


