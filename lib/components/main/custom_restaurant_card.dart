import 'package:flutter/material.dart';
import 'package:plate_perks/models/restaurant_model.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/static/app_assets.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class CustomRestaurantCard extends StatelessWidget {
  const CustomRestaurantCard({
    required this.restaurantData,
    required this.image,
    super.key,
  });

  final RestaurantData restaurantData;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          height: AppDimensions.getHeight(285),
          width: AppDimensions.getWidth(170),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: AppDimensions.getWidth(188),
                width: AppDimensions.getWidth(170),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimensions.getWidth(12)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(image),
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(16),vertical: AppDimensions.getWidth(8), ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(restaurantData.name, style: Theme.of(context).textTheme.titleMedium,),
                    SizedBox(width: AppDimensions.getWidth(7),),
                    Row(
                      children: [
                        Image.asset(AppAssets.locationPin, width: 15,height: 15,),
                        SizedBox(width: AppDimensions.getWidth(5),),
                        Text(restaurantData.city, style: Theme.of(context).textTheme.titleSmall,),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
        Container(
          height: AppDimensions.getHeight(30),
          width: AppDimensions.getWidth(60),
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(AppDimensions.getWidth(12)), bottomStart: Radius.circular(AppDimensions.getWidth(12))),
              color: AppColors.kLightBlackColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 10,
                    offset: const Offset(0, -1)
                )
              ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.star, color: AppColors.kYellowColor,size: AppDimensions.getWidth(17),),
              Text('${restaurantData.ratings}', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white, fontSize: 12)),
            ],
          ),
        ),

      ],
    );
  }
}
