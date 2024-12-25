import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/components/features/orders/order_quantity_counter.dart';
import 'package:plate_perks/end_point.dart';
import 'package:plate_perks/models/order/order_response_model.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/static/routes.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';
import 'package:plate_perks/views/settings/order/order_details.dart';


class OrderTile extends StatelessWidget {
  const OrderTile({
    super.key,
    required this.food,
    required this.order,
    required this.orderIndex,
  });

  final dynamic food;
  final OrderItem order;
  final int orderIndex;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(AppRoutes.orderDetail, arguments: OrderDetails(orderItem: order));
      },
      child: Container(
        width: double.infinity,
        height: AppDimensions.getHeight(80),
        margin: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(AppColors.kDefaultPadding), vertical: AppDimensions.getHeight(AppColors.kDefaultPadding / 3)),
        child: Row(
          children: [
            Container(
              height: AppDimensions.getWidth(80),
              width: AppDimensions.getWidth(80),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimensions.getWidth(12)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('${AppEndPoint.server}${food.images[0].image}'))
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: AppDimensions.getWidth(16)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppDimensions.getHeight(10)),
                  SizedBox(
                      width: AppDimensions.getWidth(160),
                      child: Text(food.name, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18), maxLines: 1 , overflow: TextOverflow.ellipsis,)),
                  SizedBox(height: AppDimensions.getHeight(8),),
                  Text('\$${food.price}', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16)),
                ],
              ),
            ),
            const Spacer(),
            OrderQuantityCounter(order: order,orderIndex: orderIndex),

          ],
        ),

      ),
    );
  }
}

