import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/core/controllers/features/cart_controller.dart';
import 'package:plate_perks/core/controllers/starter/food_controller.dart';
import 'package:plate_perks/core/repositories/features/order_repository.dart';
import 'package:plate_perks/core/services/app_services.dart';
import 'package:plate_perks/end_point.dart';
import 'package:plate_perks/models/cart/cart_response_model.dart';
import 'package:plate_perks/models/order/checkout_response_model.dart';
import 'package:plate_perks/models/order/order_model.dart';
import 'package:plate_perks/models/order/order_response_model.dart';
import 'package:plate_perks/utils/states/data_status.dart';

class OrderController extends GetxController{
  final OrderRepo orderRepo;
  final AppServices appServices;
  OrderController({required this.orderRepo, required this.appServices});
  List<Order> order = [];
  List<CartData> cart = Get.find<CartController>().cart;
  late TextEditingController city;
  late TextEditingController state;
  late TextEditingController street;
  late TextEditingController zipCode;
  late TextEditingController country;
  late TextEditingController phoneNumber;

  DataStatus _dataStatus = DataStatus.freeze;
  DataStatus _orderStatus = DataStatus.freeze;
  FoodController foodController = Get.find();
  CartController cartController = Get.find();
  @override
  void onInit() {
    getFoodOrders();
    city = TextEditingController();
    state = TextEditingController();
    street = TextEditingController();
    zipCode = TextEditingController();
    country = TextEditingController();
    phoneNumber = TextEditingController();
    super.onInit();
  }
  DataStatus get dataStatus => _dataStatus;
  DataStatus get orderStatus => _orderStatus;

  int _count = 1;
  int get count => _count;

  set count(int newCount){
    _count = newCount;
    update(['order_quantity_counter']);
  }
  set dataStatus(DataStatus newStatus){
    _dataStatus = newStatus;
    update();
  }
  set orderStatus(DataStatus newStatus){
    _orderStatus = newStatus;
    update();
  }

  Future<String> getFoodOrders()async{
    dataStatus = DataStatus.loading;
    try{
      String token = appServices.getStorage.read(AppEndPoint.userToken);
      orderRepo.apiHelper.updateHeader(token);

      Response response = await orderRepo.getAllOrdersData();
      if(response.statusCode == 200){
        dataStatus = DataStatus.success;

        order.addAll(OrderResponseModel.fromJson(response.body).orders);
        update(['food_orders']);
        return 'success';
      }else{
        dataStatus = DataStatus.failed;
        return 'failed';
      }
    }catch (e) {
      dataStatus = DataStatus.error;
      debugPrint('Error occurred While Getting Orders Data: $e');
      return 'Error $e';
    }
  }



  String _checkoutUrl = '';
  String get checkoutUrl => _checkoutUrl;

  set checkoutUrl(String newUrl){
    _checkoutUrl = newUrl;
    update();
  }

  Future<Order> makeFoodOrder({required OrderModel orderModel}) async {
    orderStatus = DataStatus.loading;
    String token = appServices.getStorage.read(AppEndPoint.userToken);
    orderRepo.apiHelper.updateHeader(token);

    Response response = await orderRepo.addFoodOrder(body: orderModel.toJson());
    if (response.statusCode == 201) {
      await cartController.getMyCart();
      orderStatus = DataStatus.success;
      Order orderResponse = Order.fromJson(response.body);
      checkOut(id: orderResponse.id);
      debugPrint("Order Message: ${response.statusText}");
      return orderResponse;
    } else {
      orderStatus = DataStatus.failed;
      throw Exception('Failed to Make an order: ${response.statusText}');
    }
  }
  //amr.elnemr24@example.com
  //4242424242424242
  Future<CheckoutResponseModel> checkOut({required int id}) async {
    String token = appServices.getStorage.read(AppEndPoint.userToken);
    orderRepo.apiHelper.updateHeader(token);

    Response response = await orderRepo.foodCheckout(id: id, body: {
      'quantity' : 3
    });
    if (response.statusCode == 200) {
      CheckoutResponseModel checkoutResponseModel = CheckoutResponseModel.fromJson(response.body);
      checkoutUrl = checkoutResponseModel.url;
      debugPrint("checkOut Message: ${response.statusText}");
      return checkoutResponseModel;
    } else {
      throw Exception('Failed to checkout an order: ${response.statusText}');
    }
  }


  /// Quantity Counter for updating ordered order
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

  /// Quantity Counter for creating order
  void cartQuantityCountUp(int index) {
    cart[index].quantity++;
    update(['cart_quantity_counter_$index']);
  }

  void cartQuantityCountDown(int index) {
    if (cart[index].quantity > 1) {
      cart[index].quantity--;
      update(['cart_quantity_counter_$index']);
    }
  }

  @override
  void dispose() {
    order.clear();
    super.dispose();
  }

}