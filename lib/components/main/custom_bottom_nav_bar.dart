import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/controllers/starter/main_page_controller.dart';
import 'package:plate_perks/components/main/bottom_nav_icon.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/static/app_assets.dart';


class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    required this.mainController,
    super.key,
  });
  final MainPageController mainController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppDimensions.getHeight(65),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 10,
                offset: const Offset(0, -1)
            )
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomNavIcon(onTap: (){
            mainController.currentIndex = 0;
          },
            icon: AppAssets.home,
            label: 'home'.tr,
            isSelected: mainController.currentIndex == 0 ? true : false,
          ),
          BottomNavIcon(onTap: (){
            mainController.currentIndex = 1;
          },
            icon: AppAssets.search,
            label: 'search'.tr,
            isSelected: mainController.currentIndex == 1 ? true : false,
          ),
          BottomNavIcon(onTap: (){
            mainController.currentIndex = 2;
          },
            icon: AppAssets.recent,
            label: 'recent'.tr,
            isSelected: mainController.currentIndex == 2 ? true : false,
          ),
          BottomNavIcon(onTap: (){
            mainController.currentIndex = 3;
          },
            icon: AppAssets.profile,
            label: 'prof'.tr,
            isSelected: mainController.currentIndex == 3 ? true : false,
          ),
        ],
      ),
      // child: BottomNavigationBar(
      //   backgroundColor: Colors.white,
      //     onTap: (index){
      //       controller.currentIndex = index;
      //     },
      //     currentIndex: controller.currentIndex,
      //     items: [
      //       BottomNavigationBarItem(icon: const Icon(Icons.home), label: 'home'.tr),
      //       BottomNavigationBarItem(icon: const Icon(Icons.search), label: 'search'.tr),
      //       BottomNavigationBarItem(icon: const Icon(Icons.refresh), label: 'recent'.tr),
      //       BottomNavigationBarItem(icon: const Icon(Icons.person), label: 'prof'.tr),
      //     ]
      // ),
    );
  }
}
