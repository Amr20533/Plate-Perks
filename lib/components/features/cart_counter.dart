import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/components/features/cart/circular_button.dart';
import 'package:plate_perks/controllers/features/cart_controller.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class CartCounter extends StatelessWidget {
  const CartCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (cart){
      return Row(
        children: [
          CircularButton(
            onTap: (){
              cart.countDown();
            },
            color: AppColors.kGreyColor,
            icon: Icons.remove,
          ),
          Container(
            width: AppDimensions.getWidth(35),
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(8)),
            child: Text('${cart.count}', style: Theme.of(context).textTheme.titleMedium,)),
          CircularButton(
            onTap: (){
              cart.countUp();
            },
            color: AppColors.kPrimaryColor,
            icon: Icons.add,
          ),
        ],
      );
    });
  }
}

