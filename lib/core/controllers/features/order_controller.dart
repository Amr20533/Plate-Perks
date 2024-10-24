import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/core/controllers/starter/food_controller.dart';
import 'package:plate_perks/core/repositories/features/order_repository.dart';
import 'package:plate_perks/core/services/app_services.dart';
import 'package:plate_perks/end_point.dart';
import 'package:plate_perks/models/order/order_response_model.dart';
import 'package:plate_perks/utils/states/data_status.dart';

class OrderController extends GetxController{
  final OrderRepo orderRepo;
  final AppServices appServices;
  OrderController({required this.orderRepo, required this.appServices});
  List<Order> order = [];

  DataStatus _dataStatus = DataStatus.loading;
  FoodController foodController = Get.find();
  @override
  void onInit() {
    getFoodOrders();
    super.onInit();
  }
  DataStatus get dataStatus => _dataStatus;

  int _count = 1;
  int get count => _count;

  set count(int newCount){
    _count = newCount;
    update(['order_quantity_counter']);
  }
  set dataStatus(DataStatus newStatus){
    _dataStatus = newStatus;
    update(['order_data_status']);
  }

  Future<String> getFoodOrders()async{
    dataStatus = DataStatus.loading;
    update();
    try{
      String token = appServices.getStorage.read(AppEndPoint.userToken);
      orderRepo.apiHelper.updateHeader(token);

      Response response = await orderRepo.getAllOrdersData();
      if(response.statusCode == 200){

        order.addAll(OrderResponseModel.fromJson(response.body).orders);
        update(['food_orders']);
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
      debugPrint('Error occurred While Getting Orders Data: $e');
      return 'Error $e';
    }
  }
  
  
  void orderQuantityCountUp(int index) {
    order[index].orderItems[index].quantity++;
    update(['order_quantity_counter_$index']);
  }

  void orderQuantityCountDown(int index) {
    if (order[index].orderItems[index].quantity > 1) {
      order[index].orderItems[index].quantity--;
      update(['order_quantity_counter_$index']);
    }
  }


  @override
  void dispose() {
    super.dispose();
  }

}