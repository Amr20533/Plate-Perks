import 'package:get/get.dart';
import 'package:plate_perks/dependencies/api_helper.dart';
import 'package:plate_perks/end_point.dart';

class RestaurantRepo extends GetxService{
  final ApiHelper apiHelper;
  RestaurantRepo({required this.apiHelper});

  Future<Response> getRestaurantData()async{
    return await apiHelper.getData(AppEndPoint.getAllRestaurant);
  }


}