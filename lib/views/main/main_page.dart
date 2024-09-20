import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/controllers/starter/main_page_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(builder: (controller){
      return Scaffold(
        body: SafeArea(child: SingleChildScrollView(child: controller.screens[controller.currentIndex],)),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              controller.currentIndex = index;
            },
            currentIndex: controller.currentIndex,
            items: [
              BottomNavigationBarItem(icon: const Icon(Icons.home), label: 'home'.tr),
              BottomNavigationBarItem(icon: const Icon(Icons.search), label: 'search'.tr),
              BottomNavigationBarItem(icon: const Icon(Icons.refresh), label: 'recent'.tr),
              BottomNavigationBarItem(icon: const Icon(Icons.person), label: 'prof'.tr),
            ]
        ),
      );
    });
  }
}
