import 'package:get/get.dart';
import 'package:plate_perks/core/dependencies/api_helper.dart';
import 'package:plate_perks/end_point.dart';

class RecentRepo extends GetxService{
  final ApiHelper apiHelper;
  RecentRepo({required this.apiHelper});

  Future<Response> getRecentData()async{
    return await apiHelper.getData(AppEndPoint.getAllRestaurant);
  }


}