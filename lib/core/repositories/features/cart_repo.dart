import 'package:get/get.dart';
import 'package:plate_perks/core/dependencies/api_helper.dart';
import 'package:plate_perks/end_point.dart';

class CartRepo extends GetxService{
  final ApiHelper apiHelper;
  CartRepo({required this.apiHelper});

  Future<Response> getAllCartData()async{
    return await apiHelper.getAuthData(
      AppEndPoint.getFoodInCart,
    );
  }


}