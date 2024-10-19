import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/components/default/custom_details_app_bar.dart';
import 'package:plate_perks/components/features/cart/empty_cart.dart';
import 'package:plate_perks/components/placeholder/data_receiver_status_view.dart';
import 'package:plate_perks/core/controllers/features/cart_controller.dart';
import 'package:plate_perks/end_point.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: Get.find<CartController>(),
      id: 'food_cart',
      builder: (cartController){
      return Scaffold(
        appBar: customDetailsAppBar(context, title: 'my-cart'.tr),
        body: DataReceiverStateView(
          status: cartController.dataStatus,
          child: cartController.cart.isEmpty ? const EmptyCart() : ListView(
            children: List.generate(cartController.cart.length, (cartIndex){
              final cart = cartController.cart[cartIndex];
              final food = cartController.foodController.food.firstWhere((food) => food.id == cart.food);

              return Container(
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
                      padding: EdgeInsets.only(left: AppDimensions.getWidth(16)),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: AppDimensions.getHeight(10)),
                          Text(food.name, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18), maxLines: 1 , overflow: TextOverflow.ellipsis,),
                          SizedBox(height: AppDimensions.getHeight(8),),
                          Text('\$${food.price}', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16)),
                        ],
                      ),
                    ),

                  ],
                ),

              );
            }),
          ),
        ),
            );
    });
  }
}

