import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:plate_perks/components/features/cart/circular_button.dart';
import 'package:plate_perks/core/controllers/features/order_controller.dart';
import 'package:plate_perks/end_point.dart';
import 'package:plate_perks/models/food_model.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class OrderInfoBar extends StatelessWidget {
  const OrderInfoBar({
    super.key,
    required this.foodData,
    required this.cartIndex,
    required this.controller,
  });

  final FoodData foodData;
  final int cartIndex;
  final OrderController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppDimensions.getHeight(80),
      margin: EdgeInsets.symmetric(vertical: AppDimensions.getHeight(AppColors.kDefaultPadding / 3), horizontal: AppDimensions.getHeight(AppColors.kDefaultPadding)),
      child: Row(
        children: [
          Container(
            height: AppDimensions.getWidth(80),
            width: AppDimensions.getWidth(80),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimensions.getWidth(12)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('${AppEndPoint.server}${foodData.images[0].image}'))
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: AppDimensions.getWidth(16)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppDimensions.getHeight(10)),
                SizedBox(
                    width: AppDimensions.getWidth(160),
                    child: Text(foodData.name, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18), maxLines: 1 , overflow: TextOverflow.ellipsis,)),
                SizedBox(height: AppDimensions.getHeight(8),),
                Text('\$${foodData.price}', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16)),
              ],
            ),
          ),
          const Spacer(),
          GetBuilder<OrderController>(
              id: 'cart_quantity_counter_$cartIndex',
              builder: (cartCtrl){
                return Row(
                  children: [
                    CircularButton(
                      onTap: (){
                        cartCtrl.cartQuantityCountDown(cartIndex);
                      },
                      color: AppColors.kGreyColor,
                      icon: Icons.remove,
                    ),
                    Container(
                        width: AppDimensions.getWidth(15),
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(8)),
                        child: Text('${controller.cart[cartIndex].quantity}', style: Theme.of(context).textTheme.titleMedium,)
                    ),
                    CircularButton(
                      onTap: (){
                        cartCtrl.cartQuantityCountUp(cartIndex);
                      },
                      color: AppColors.kPrimaryColor,
                      icon: Icons.add,
                    ),
                  ],
                );
              }),

        ],
      ),

    );
  }
}
