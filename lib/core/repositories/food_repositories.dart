import 'package:get/get.dart';
import 'package:plate_perks/core/dependencies/api_helper.dart';
import 'package:plate_perks/end_point.dart';

class FoodRepo extends GetxService{
  final ApiHelper apiHelper;
  FoodRepo({required this.apiHelper});

  Future<Response> getFoodData()async{
    return await apiHelper.getData(AppEndPoint.getAllFoodData);
  }


}