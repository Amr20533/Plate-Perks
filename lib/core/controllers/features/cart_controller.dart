import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/core/controllers/starter/food_controller.dart';
import 'package:plate_perks/core/repositories/features/cart_repo.dart';
import 'package:plate_perks/core/services/app_services.dart';
import 'package:plate_perks/end_point.dart';
import 'package:plate_perks/models/cart/cart_model.dart';
import 'package:plate_perks/models/cart/cart_response_model.dart';
import 'package:plate_perks/utils/states/data_status.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  final AppServices appServices;
  CartController({required this.cartRepo, required this.appServices});
  List<CartData> cart = [];
  // RxList<CartData> cart = <CartData>[].obs;

  DataStatus _dataStatus = DataStatus.loading;
  FoodController foodController = Get.find();
  @override
  void onInit() {
    super.onInit();
    getMyCart();
  }
  DataStatus get dataStatus => _dataStatus;

  int _count = 1;
  int get count => _count;

  set count(int newCount){
    _count = newCount;
    update(['food_counter']);
  }
  set dataStatus(DataStatus newStatus){
    _dataStatus = newStatus;
    update(['cart_data_status']);
  }

  Future<String> getMyCart()async{
    dataStatus = DataStatus.loading;
    update();
    try{
      String token = appServices.getStorage.read(AppEndPoint.userToken);
      cartRepo.apiHelper.updateHeader(token);

      Response response = await cartRepo.getAllCartData();
      if(response.statusCode == 200){

        cart.addAll(CartResponseModel.fromJson(response.body).cart);
        update(['food_cart']);
        dataStatus = DataStatus.success;
        update();
        return 'success';
      }else{
        dataStatus = DataStatus.failed;
        update();
        return 'failed';
      }
    }catch (e) {
      dataStatus = DataStatus.error;
      update();
      debugPrint('Error occurred While Getting Profile Data: $e');
      return 'Error $e';
    }
  }


  Future<void> addFoodToCart({required int id, required CartModel cartModel}) async {
    String token = appServices.getStorage.read(AppEndPoint.userToken);
    debugPrint(">>> $token");
    cartRepo.apiHelper.updateHeader(token);

    Response response = await cartRepo.addCartFood(foodId: id, body: cartModel.toJson());
    if (response.statusCode == 201) {
      // cart.addAll(CartResponseModel.fromJson(response.body).cart);
      cart.clear();

      await getMyCart();

      debugPrint("Cart Message: ${response.statusText}");
    } else {
      throw Exception('Failed to Add Cart Data: ${response.statusText}');
    }
  }



  Future<void> removerFoodFromCart({required int id}) async {
    String token = appServices.getStorage.read(AppEndPoint.userToken);
    debugPrint(">>> $token");
    cartRepo.apiHelper.updateHeader(token);

    Response response = await cartRepo.removeCartFood(foodId: id);

    debugPrint('Response Status Code: ${response.statusCode}');
    debugPrint('Response Status Text: ${response.statusText}');
    debugPrint('Response Body: ${response.body}');

    if (response.statusCode == 204) {
      cart.clear();
      await getMyCart();
      debugPrint("Remove Cart Message: ${response.statusText}");
    } else {
      throw Exception('Failed to Remove Cart Item: ${response.statusText}');
    }
  }



  void countUp(){
    count++;
  }
  void countDown(){
    if(_count > 1){
      count--;
    }
  }


  @override
  void dispose() {
    cart.clear();
    super.dispose();
  }

}