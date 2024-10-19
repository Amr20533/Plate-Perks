import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/core/controllers/starter/food_controller.dart';
import 'package:plate_perks/core/repositories/features/cart_repo.dart';
import 'package:plate_perks/core/services/app_services.dart';
import 'package:plate_perks/end_point.dart';
import 'package:plate_perks/models/cart/cart_response_model.dart';
import 'package:plate_perks/utils/states/data_status.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  final AppServices appServices;
  CartController({required this.cartRepo, required this.appServices});
  List<CartData> cart = [];
  DataStatus dataStatus = DataStatus.loading;
  FoodController foodController = Get.find();
  @override
  void onInit() {
    super.onInit();
    getMyCart();
  }

  int _count = 1;
  int get count => _count;

  set count(int newCount){
    _count = newCount;
    update();
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

  void countUp(){
    _count++;
    update();
  }
  void countDown(){
    if(_count > 1){
      _count--;
    }
    update();
  }




  @override
  void dispose() {
    super.dispose();
  }

}