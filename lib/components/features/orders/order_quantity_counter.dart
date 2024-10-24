import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/components/features/cart/circular_button.dart';
import 'package:plate_perks/core/controllers/features/order_controller.dart';
import 'package:plate_perks/models/order/order_response_model.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class OrderQuantityCounter extends StatelessWidget {
  const OrderQuantityCounter({
    super.key,
    required this.order,
    required this.orderIndex,
  });

  final OrderItem order;
  final int orderIndex;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
        id: 'order_quantity_counter_$orderIndex',
        builder: (cartCtrl){
          return Row(
            children: [
              CircularButton(
                onTap: (){
                  cartCtrl.orderQuantityCountDown(orderIndex);
                },
                color: AppColors.kGreyColor,
                icon: Icons.remove,
              ),
              Container(
                  width: AppDimensions.getWidth(15),
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(8)),
                  child: Text('${order.quantity}', style: Theme.of(context).textTheme.titleMedium,)),
              CircularButton(
                onTap: (){
                  cartCtrl.orderQuantityCountUp(orderIndex);
                },
                color: AppColors.kPrimaryColor,
                icon: Icons.add,
              ),
            ],
          );
        });
  }
}
