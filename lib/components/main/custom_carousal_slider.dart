import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/core/controllers/starter/main_page_controller.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/static/app_assets.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class CustomCarousalSlider extends StatelessWidget {
  const CustomCarousalSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(builder: (controller){
      return Padding(
        padding: EdgeInsets.only(top: AppDimensions.getHeight(12)),
        child: CarouselSlider(
          options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              enableInfiniteScroll: true,
              viewportFraction: 1.0,
              onPageChanged: (int page, _){
                controller.currentPage = page;
              }
          ),
          items: [
            Container(
              width: AppDimensions.getWidth(360),
              height: 200,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(16)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimensions.getWidth(12)),
                  color: AppColors.kPrimaryColor,
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(AppAssets.offer))
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: AppDimensions.getWidth(100),
                      height: AppDimensions.getHeight(100),
                      child: Text('super-deal'.tr, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white, fontSize: 24))),
                  SizedBox(height: AppDimensions.getHeight(8),),
                  Text('40% ${'off'.tr}', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),)
                ],
              ),
            ),
            Container(
              width: AppDimensions.getWidth(360),
              height: 200,
              padding: EdgeInsets.only(top: AppDimensions.getHeight(12), bottom: AppDimensions.getHeight(8)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimensions.getWidth(12)),
                  image: const DecorationImage(
                      fit:BoxFit.cover,
                      image: AssetImage(AppAssets.superFamily))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Center(child: Text('super-family'.tr, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white, fontSize: 24),textAlign: TextAlign.center,)),
                      SizedBox(height: AppDimensions.getHeight(8),),
                      Text('35% ${'off'.tr}', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),)
                    ],
                  ),
                  Text('min-people'.tr, style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),)
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  width: AppDimensions.getWidth(360),
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppDimensions.getWidth(12)),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(AppAssets.comboDeal))
                  ),
                ),
                Positioned(
                    right: 0,top: 0,bottom: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(AppDimensions.getWidth(12)), bottomRight: Radius.circular(AppDimensions.getWidth(12))),
                      child: Container(
                        width: AppDimensions.getWidth(150),
                        // height: 200,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              opacity: 0.8,
                              image: AssetImage(AppAssets.ellipse),
                            )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(child: Text('combo'.tr, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),textAlign: TextAlign.center,)),
                            SizedBox(height: AppDimensions.getHeight(8),),
                            Text('40% ${'off'.tr}', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),)
                          ],
                        ),
                      ),
                    )
                ),
        
              ],
            )
          ],
        ),
      );
    });
  }
}
