import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/controllers/starter/restaurant_controller.dart';
import 'package:plate_perks/end_point.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';

class StarterPoint extends StatelessWidget {
  const StarterPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${"4".tr} Amr Elnemr', style: Theme.of(context).textTheme.titleLarge,),



        GetBuilder<RestaurantController>(builder: (controller){
          return SizedBox(
            height: AppDimensions.getHeight(255),
            child: ListView.separated(
                itemCount: controller.restaurant.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                  height: AppDimensions.getHeight(255),
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
                  height: AppDimensions.getWidth(200),
                  width: AppDimensions.getWidth(170),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimensions.getWidth(12)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('${AppEndPoint.server}${controller.restaurant[0].images[0].image}'))
                      ),
                      ),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.restaurant[index].name, style: Theme.of(context).textTheme.titleMedium,),
                          Text(controller.restaurant[index].city, style: Theme.of(context).textTheme.titleSmall,),
                        ],
                      ),
                    ],
                  ),
                ), separatorBuilder: (context, index) => SizedBox(width: 6,)),
          );
        })
      ],
    );
  }
}
