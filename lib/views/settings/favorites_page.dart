import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/components/default/custom_details_app_bar.dart';
import 'package:plate_perks/components/features/favorites/custom_fav_card.dart';
import 'package:plate_perks/components/features/favorites/empty_favorites.dart';
import 'package:plate_perks/core/controllers/features/favorite_controller.dart';
import 'package:plate_perks/core/controllers/starter/food_controller.dart';
import 'package:plate_perks/end_point.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/class/bottom_sheet_handler.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customDetailsAppBar(context, title: 'favorite'.tr),
      body: GetBuilder<FoodController>(
          id: 'food_favorites',
          builder: (controller){
            return GetBuilder<FavoriteController>(
                id: 'food_favorites',
                builder: (favController){
                  return favController.favoritesMap.isNotEmpty ? Container(
                    margin: EdgeInsets.only(left: AppDimensions.getWidth(AppColors.kDefaultPadding)),
                    child: ListView.separated(
                        itemCount: controller.food.length,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          bool isFavorite = favController.favoritesMap[controller.food[index].id.toString()] == true ? true : false;

                          return isFavorite ? GestureDetector(
                            onTap: (){
                              BottomSheetHandler().foodBottomSheet(foodData: controller.food[index]);
                            },
                            child: CustomFavoriteCard(
                                favTap: (){
                                  favController.addFoodToFavorite(id: controller.food[index].id);
                                },
                                favFood: isFavorite,
                                foodModel: controller.food[index],
                                image: '${AppEndPoint.server}${controller.food[index].images[0].image}'),
                          ) : const SizedBox.shrink();
                        },
                        separatorBuilder: (context, index) => SizedBox(height: AppDimensions.getHeight(10))
                    ),
                  ) : const EmptyFavorites();
                });
          }),
    );
  }

}
