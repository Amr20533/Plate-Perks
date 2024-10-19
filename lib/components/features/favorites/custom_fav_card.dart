import 'package:flutter/material.dart';
import 'package:plate_perks/models/food_model.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';


class CustomFavoriteCard extends StatelessWidget {
  const CustomFavoriteCard({
    required this.favTap,
    required this.foodModel,
    required this.image,
    this.favFood = false,
    super.key,
  });
  final FoodData foodModel;
  final String image;
  final bool favFood;
  final VoidCallback favTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.getHeight(114),
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(8)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.getWidth(12)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 10,
                offset: const Offset(0, -1)
            )
          ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(alignment: Alignment.topRight,
            children: [
              Container(
                height: AppDimensions.getWidth(100),
                width: AppDimensions.getWidth(100),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimensions.getWidth(12)),
                    // color: Colors.white,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(image))
                ),
              ),
              InkWell(
                onTap: favTap,
                child: Container(
                  width: AppDimensions.getWidth(30),
                  height: AppDimensions.getWidth(30),
                  decoration: BoxDecoration(
                    color: favFood ? AppColors.kPrimaryColor : AppColors.kLightGreyColor,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(AppDimensions.getWidth(12)), bottomLeft: Radius.circular(AppDimensions.getWidth(12))),
                  ),
                  child: Icon(Icons.favorite_border, color: favFood ? Colors.white : AppColors.kGreyColor, size: 22,),
                ),
              )

            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: AppDimensions.getWidth(16)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppDimensions.getHeight(10)),
                Text(foodModel.name, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20), maxLines: 1 , overflow: TextOverflow.ellipsis,),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppDimensions.getHeight(6)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.star, color: AppColors.kYellowColor,size: AppDimensions.getWidth(19),),
                      SizedBox(width: AppDimensions.getWidth(4),),
                      Text('${foodModel.ratings}', style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: AppDimensions.getWidth(16),)),
                    ],
                  ),
                ),
                Text('\$${foodModel.price}', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
