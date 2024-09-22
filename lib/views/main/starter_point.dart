import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/controllers/starter/food_controller.dart';
import 'package:plate_perks/controllers/starter/main_page_controller.dart';
import 'package:plate_perks/controllers/starter/restaurant_controller.dart';
import 'package:plate_perks/end_point.dart';
import 'package:plate_perks/components/main/custom_carousal_slider.dart';
import 'package:plate_perks/components/main/custom_dot_indicator.dart';
import 'package:plate_perks/components/main/custom_food_card.dart';
import 'package:plate_perks/components/main/custom_restaurant_card.dart';
import 'package:plate_perks/components/main/custom_see_all_bar.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/class/bottom_sheet_handler.dart';
import 'package:plate_perks/utils/static/app_assets.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class StarterPoint extends StatelessWidget {
  const StarterPoint({super.key});

  @override
  Widget build(BuildContext context) {
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
                    Text('${"4".tr} Amr', style: Theme.of(context).textTheme.titleLarge,),
                    SizedBox(height: AppDimensions.getHeight(3),),
                    Text("5".tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 14),),
                  ],
                ),
                const Stack(
                  children:  [
                    Icon(Icons.shopping_cart, color: AppColors.kGreyColor, size: 25,),
                    Positioned(
                      top: 0, right: 3,
                        child: CircleAvatar(
                          radius: 4,
                          backgroundColor: AppColors.kPrimaryColor,
                        )),
                  ],
                )
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
                    image:'${AppEndPoint.server}${controller.restaurant[0].images[0].image}',
                  ), separatorBuilder: (context, index) => SizedBox(width: AppDimensions.getWidth(6))),
            );
          }),



          CustomSeeAllBar(
            onPressed: (){

            },
            text: 'popular-food'.tr,
          ),

          GetBuilder<FoodController>(builder: (controller){
            return Container(
              height: AppDimensions.getHeight(280),
              color: Colors.transparent,
              margin: EdgeInsets.only(left: AppDimensions.getWidth(AppColors.kDefaultPadding)),
              child: ListView.separated(
                  itemCount: controller.food.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>  GestureDetector(
                    onTap: (){
                      BottomSheetHandler().foodBottomSheet(foodData: controller.food[index]);
                    },
                    child: CustomFoodCard(foodModel: controller.food[index],
                        image: '${AppEndPoint.server}${controller.food[index].images[0].image}'),
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: AppDimensions.getWidth(6))),
            );
          }),

          SizedBox(height: AppDimensions.getHeight(20),),



        ],
      ),
    );
  }
}





