import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/components/default/custom_details_app_bar.dart';
import 'package:plate_perks/components/features/cart/empty_cart.dart';
import 'package:plate_perks/components/features/orders/order_tile.dart';
import 'package:plate_perks/components/placeholder/data_receiver_status_view.dart';
import 'package:plate_perks/core/controllers/features/order_controller.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
        init: Get.find<OrderController>(),
        id: 'food_orders',
        builder: (orderController){
          return Scaffold(
            appBar: customDetailsAppBar(context, title: 'orders'.tr),
            body: DataReceiverStateView(
              status: orderController.dataStatus,
              child: orderController.order.isEmpty
                  ? const EmptyCart()
                  : ListView.builder(
                itemCount: orderController.order.length,
                itemBuilder: (context, orderIndex) {
                  final order = orderController.order[orderIndex];

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: order.orderItems.length,
                    itemBuilder: (context, itemIndex) {
                      final orderItem = order.orderItems[itemIndex];
                      final food = orderController.foodController.food.firstWhere((food) => food.id == orderItem.foodId);

                      return OrderTile(food: food, order: orderItem, orderIndex: orderIndex);
                    },
                  );
                },
              ),
            ),          );
        });
  }
}

