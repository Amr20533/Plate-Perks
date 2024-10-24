import 'package:get/get.dart';
import 'package:plate_perks/core/dependencies/api_helper.dart';
import 'package:plate_perks/end_point.dart';

class OrderRepo extends GetxService{
  final ApiHelper apiHelper;
  OrderRepo({required this.apiHelper});

  Future<Response> getAllOrdersData()async{
    return await apiHelper.getAuthData(
      AppEndPoint.getFoodOrders,
    );
  }
  Future<Response> addFoodOrder({required int id,required Map<String, dynamic> body})async{
    return await apiHelper.postData(
        '${AppEndPoint.makeFoodOrder}/$id',
        body
    );
  }

}