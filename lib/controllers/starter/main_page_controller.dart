import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/repositories/restaurant_repository.dart';
import 'package:plate_perks/views/main/recent_view.dart';
import 'package:plate_perks/views/main/starter_point.dart';

class MainPageController extends GetxController{
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  int _currentPage = 0;
  int get currentPage => _currentPage;


  List<Widget> screens = [
    const StarterPoint(),
    const Center(child: Text('Screen')),
    const RecentView(),
    const Center(child: Text('Screen'),),

  ];


  set  currentIndex(int newIndex){
    _currentIndex = newIndex;
    update();
  }
  set  currentPage(int newIndex){
    _currentPage = newIndex;
    update();
  }



  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}