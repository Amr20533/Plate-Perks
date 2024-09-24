import 'package:get/get.dart';
import 'package:plate_perks/core/dependencies/api_helper.dart';
import 'package:plate_perks/end_point.dart';

class FavoriteRepo extends GetxService{
  final ApiHelper apiHelper;
  FavoriteRepo({required this.apiHelper});

  Future<Response> getAllFavoriteFood()async{
    return await apiHelper.getAuthData(
      AppEndPoint.getFoodFromFavorite,
    );
  }


}