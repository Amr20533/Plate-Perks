import 'package:flutter/material.dart';
import 'package:plate_perks/components/features/orders/order_quantity_counter.dart';
import 'package:plate_perks/models/order/order_response_model.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class CustomOrderView extends StatelessWidget {
  const CustomOrderView({
    super.key,
    required this.orderItem,
  });

  final OrderItem orderItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppDimensions.getHeight(80),
      margin: EdgeInsets.symmetric(vertical: AppDimensions.getHeight(AppColors.kDefaultPadding / 3)),
      child: Row(
        children: [
          Container(
            height: AppDimensions.getWidth(80),
            width: AppDimensions.getWidth(80),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.getWidth(12)),
              // image: DecorationImage(
              //     fit: BoxFit.cover,
              //     image: NetworkImage('${AppEndPoint.server}${food.images[0].image}'))
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: AppDimensions.getWidth(16)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppDimensions.getHeight(10)),
                SizedBox(
                    width: AppDimensions.getWidth(160),
                    child: Text(orderItem.name, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18), maxLines: 1 , overflow: TextOverflow.ellipsis,)),
                SizedBox(height: AppDimensions.getHeight(8),),
                Text('\$${orderItem.price}', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16)),
              ],
            ),
          ),
          const Spacer(),
          OrderQuantityCounter(order: orderItem,orderIndex: 0),

        ],
      ),

    );
  }
}
