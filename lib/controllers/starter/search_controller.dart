import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:plate_perks/repositories/restaurant_repository.dart';

class SearchController extends GetxController{
  late TextEditingController searchController;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  // List<dynamic> _search = [];
  // List<dynamic> get search => _search;




  @override
  void onInit() {
    searchController = TextEditingController();
    searchController.addListener(() => update());
    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}