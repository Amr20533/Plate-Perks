import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:plate_perks/models/food_model.dart';
import 'package:plate_perks/repositories/restaurant_repository.dart';
import 'package:plate_perks/repositories/search_repository.dart';
import 'package:plate_perks/utils/static/routes.dart';

class SearchPageController extends GetxController{
  late TextEditingController searchController;
  final SearchRepo searchRepo;
  SearchPageController({required this.searchRepo});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  // List<dynamic> _search = [];
  // List<dynamic> get search => _search;

  List<dynamic> _filteredFood = [];
  List<dynamic> get filteredFood => _filteredFood;

  Future<void> getAllFoodData()async{
    _filteredFood = [];

    try{
      Response response = await searchRepo.searchForFood(searchController.text);
      if(response.statusCode == 200){
        print("*************** Got Search Food Data ****************");
        _filteredFood.addAll(FoodModel.fromJson(response.body).data);
        _isLoaded=true;
        update();
      }else{
        print('//////////// OOOps *_* O_O  No Food Data ////////////////');
      }
    }catch (e) {
      // Handle any exceptions that occur during the request
      print('Error occurred: $e');
    }
  }

  
  
  goToSearchPage(){
    Get.toNamed(AppRoutes.search);
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    searchController.addListener(() => getAllFoodData());
    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}