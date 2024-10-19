import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:plate_perks/core/repositories/features/favorite_repo.dart';
import 'package:plate_perks/core/services/app_services.dart';
import 'package:plate_perks/end_point.dart';
import 'package:plate_perks/models/Favorites/responses/favorite_response_model.dart';

class FavoriteController extends GetxController{
  final FavoriteRepo favoriteRepo;
  final AppServices appServices;
  FavoriteController({required this.favoriteRepo, required this.appServices});

  Map<String, bool> favoritesMap = <String, bool>{};

  Future<void> getFavorites() async {
    String token = appServices.getStorage.read(AppEndPoint.userToken);
    debugPrint(">>> $token");
    favoriteRepo.apiHelper.updateHeader(token);

    Response response = await favoriteRepo.getAllFavoriteFood();

    if (response.statusCode == 200) {
      favoritesMap.clear();

      FavoriteResponseModel favoriteResponseModel = FavoriteResponseModel.fromJson(response.body);

      for (var favorite in favoriteResponseModel.favorites) {
        favoritesMap[favorite.food.toString()] = true;
      }
      update(['food_favorites']);
      debugPrint('Fav map length ${favoritesMap.length}');
      debugPrint('Your Fav Data ${favoriteResponseModel.toJson()}');


    } else {
      throw Exception('Failed to Get Favorite Data: ${response.statusText}');
    }
  }

  Future<void> addFoodToFavorite({required int id}) async {
    String token = appServices.getStorage.read(AppEndPoint.userToken);
    debugPrint(">>> $token");
    favoriteRepo.apiHelper.updateHeader(token);

    Response response = await favoriteRepo.addFavoriteFood(id: id);

    if (response.statusCode == 201) {
      favoritesMap[id.toString()] = true;
      update(['food_favorites']);

      debugPrint("Favorite Message: ${response.statusText}");

    } else if (response.statusCode == 200){
      favoritesMap[id.toString()] = false;
      debugPrint("Favorite Message: ${response.statusText}");

      update(['food_favorites']);
    }else {
      throw Exception('Failed to Add Favorite Data: ${response.statusText}');
    }
  }



  @override
  void onInit() {
    getFavorites();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}