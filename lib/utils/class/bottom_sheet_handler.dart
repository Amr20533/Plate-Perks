import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/components/default/custom_rounded_button.dart';
import 'package:plate_perks/components/features/cart_counter.dart';
import 'package:plate_perks/core/controllers/features/cart_controller.dart';
import 'package:plate_perks/end_point.dart';
import 'package:plate_perks/models/food_model.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class BottomSheetHandler{

  void foodBottomSheet({required FoodData foodData}) {
    Get.find<CartController>();

    Get.bottomSheet(
      Container(
        height: AppDimensions.getHeight(560),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(AppDimensions.getWidth(AppColors.kDefaultPadding)),topLeft: Radius.circular(AppDimensions.getWidth(AppColors.kDefaultPadding))),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 10,
                  offset: const Offset(0, -1)
              )
            ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: AppDimensions.getWidth(300),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(AppDimensions.getWidth(AppColors.kDefaultPadding)),
                          topLeft: Radius.circular(AppDimensions.getWidth(AppColors.kDefaultPadding))),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                          image: NetworkImage('${AppEndPoint.server}${foodData.images[0].image}'))
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: AppDimensions.getHeight(5),
                    width: AppDimensions.getWidth(45),
                    margin: EdgeInsets.only(top: AppDimensions.getHeight(AppColors.kDefaultPadding / 2)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppDimensions.getWidth(AppColors.kDefaultPadding)),
                        color: AppColors.kGreyColor
                     ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(AppColors.kDefaultPadding), vertical: AppDimensions.getWidth(AppColors.kDefaultPadding)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(foodData.name, style: Theme.of(Get.context!).textTheme.titleLarge,),
                          SizedBox(height: AppDimensions.getWidth(8),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(children: List.generate(5, (star) => Icon(Icons.star, color: AppColors.kYellowColor,size: AppDimensions.getWidth(19),)),),
                              SizedBox(width: AppDimensions.getWidth(4),),
                              Text(foodData.ratings, style: Theme.of(Get.context!).textTheme.titleSmall!.copyWith(fontSize: AppDimensions.getWidth(16),)),
                            ],
                          ),
                        ],
                      ),
                      const CartCounter()
                    ],
                  ),
                  GetBuilder<CartController>(builder: (cart){
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: AppDimensions.getWidth(AppColors.kDefaultPadding)),
                      child: Text('\$${(cart.count * double.parse(foodData.price)).round()}', style: Theme.of(Get.context!).textTheme.titleMedium,),
                    );
                  }),
                  SizedBox(height: AppDimensions.getHeight(AppColors.kDefaultPadding * 1.5),),
                  CustomRoundedButton(onTap: (){

                  },
                  title: 'place-order'.tr)
                ],
              ),
            ),
          ],
        ),
      ),

      isScrollControlled: true,
    );
  }

}

