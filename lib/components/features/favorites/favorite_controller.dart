import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:plate_perks/core/repositories/features/favorite_repo.dart';
import 'package:plate_perks/core/services/app_services.dart';
import 'package:plate_perks/end_point.dart';
import 'package:plate_perks/models/Favorites/responses/favorite_response_model.dart';
import 'package:plate_perks/models/auth/login_model.dart';
import 'package:plate_perks/models/auth/responses/login_response_model.dart';

class FavoriteController extends GetxController{
  final FavoriteRepo favoriteRepo;
  final AppServices appServices;
  FavoriteController({required this.favoriteRepo, required this.appServices});

  List<dynamic> favoritesData = [];

  Future<dynamic> getFavorites() async {
    String token = appServices.getStorage.read(AppEndPoint.userToken);
    debugPrint(">>> $token");
    favoriteRepo.apiHelper.updateHeader(token);
    Response response = await favoriteRepo.getAllFavoriteFood();

    if (response.statusCode == 200) {
      favoritesData = [];
      favoritesData.addAll(FavoriteResponseModel.fromJson(response.body).favorites);
      FavoriteResponseModel favoriteResponseModel = FavoriteResponseModel.fromJson(response.body);

      debugPrint('Fav list length ${favoritesData.length}');
      debugPrint('Your Fav Data ${favoriteResponseModel.toJson()}');
      return favoritesData;

    } else {
      throw Exception('Failed to Get Favorite Data: ${response.statusText}');
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