import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/core/controllers/features/cart_controller.dart';
import 'package:plate_perks/core/controllers/features/favorite_controller.dart';
import 'package:plate_perks/core/controllers/starter/food_controller.dart';
import 'package:plate_perks/core/controllers/starter/restaurant_controller.dart';
import 'package:plate_perks/end_point.dart';
import 'package:plate_perks/components/main/custom_carousal_slider.dart';
import 'package:plate_perks/components/main/custom_dot_indicator.dart';
import 'package:plate_perks/components/main/custom_food_card.dart';
import 'package:plate_perks/components/main/custom_restaurant_card.dart';
import 'package:plate_perks/components/main/custom_see_all_bar.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/class/bottom_sheet_handler.dart';
import 'package:plate_perks/utils/static/routes.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class StarterPoint extends StatelessWidget {
  const StarterPoint({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<FavoriteController>().getFavorites();
    Get.put(CartController(cartRepo: Get.find(), appServices: Get.find(), ));

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(AppColors.kDefaultPadding), vertical: AppDimensions.getHeight(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${"7".tr} Amr', style: Theme.of(context).textTheme.titleLarge,),
                    SizedBox(height: AppDimensions.getHeight(3),),
                    Text("8".tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 14),),
                  ],
                ),
                GetBuilder<CartController>(builder: (cartController){
                  return Stack(
                    children:  [
                      GestureDetector(
                        onTap: (){
                          if(cartController.cart.isNotEmpty){
                            Get.toNamed(AppRoutes.cart);
                          }else{
                            debugPrint("Your cart is Empty");
                          }

                        },
                        child: const Icon(Icons.shopping_cart, color: AppColors.kGreyColor, size: 25,)),
                      cartController.cart.isNotEmpty ? const Positioned(
                          top: 0, right: 3,
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor: AppColors.kPrimaryColor,
                          )) : const SizedBox.shrink(),
                    ],
                  );
                })
              ],
            ),
          ),




          const CustomCarousalSlider(),


          const CustomDotIndicator(),

          CustomSeeAllBar(
            onPressed: (){

            },
            text: 'restaurant'.tr,
          ),

          GetBuilder<RestaurantController>(builder: (controller){
            return Container(
              height: AppDimensions.getHeight(295),
              margin: EdgeInsets.only(left: AppDimensions.getWidth(AppColors.kDefaultPadding)),
              child: ListView.separated(
                  itemCount: controller.restaurant.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => CustomRestaurantCard(
                    restaurantData: controller.restaurant[index],
                    image:'${AppEndPoint.server}${controller.restaurant[index].images[0].image}',
                  ), separatorBuilder: (context, index) => SizedBox(width: AppDimensions.getWidth(6))),
            );
          }),



          CustomSeeAllBar(
            onPressed: (){

            },
            text: 'food'.tr,
          ),

          GetBuilder<FoodController>(
              id: 'food_favorites',
              builder: (controller){
              return GetBuilder<FavoriteController>(
                  id: 'food_favorites',
                  init: Get.find<FavoriteController>(),
                  builder: (favController){
                    return Container(
                    height: AppDimensions.getHeight(280),
                    color: Colors.transparent,
                    margin: EdgeInsets.only(left: AppDimensions.getWidth(AppColors.kDefaultPadding)),
                    child: ListView.separated(
                        itemCount: controller.food.length,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          bool isFavorite = favController.favoritesMap[controller.food[index].id.toString()] == true ? true : false;

                          return GestureDetector(
                            onTap: (){
                              BottomSheetHandler().foodBottomSheet(foodData: controller.food[index]);
                            },
                            child: CustomFoodCard(
                                favTap: (){
                                  favController.addFoodToFavorite(id: controller.food[index].id);
                                },
                                favFood: isFavorite,
                                foodModel: controller.food[index],
                                image: '${AppEndPoint.server}${controller.food[index].images[0].image}'),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(width: AppDimensions.getWidth(6))),
                  );
              });
          }),


          SizedBox(height: AppDimensions.getHeight(20),),

          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //       children: List.generate(6, (index) => Container(
          //         height: AppDimensions.getHeight(274),
          //         width: AppDimensions.getWidth(182),
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(AppDimensions.getWidth(12)),
          //             color: Colors.white,
          //             boxShadow: [
          //               BoxShadow(
          //                   color: Colors.black.withOpacity(0.12),
          //                   blurRadius: 10,
          //                   offset: const Offset(0, -1)
          //               )
          //             ]
          //         ),),)
          //   ),
          // ),

        ],
      ),
    );
  }
}





