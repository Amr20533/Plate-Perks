import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/components/search/custom_large_title.dart';
import 'package:plate_perks/components/search/popular_search_data.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/static/app_assets.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';
import 'package:svg_flutter/svg.dart';
import 'package:plate_perks/core/controllers/starter/search_controller.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SearchPageController>();
    return GetBuilder<SearchPageController>(builder: (controller){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(AppColors.kDefaultPadding),
                vertical: AppDimensions.getHeight(AppColors.kDefaultPadding)),
            child: Text("search".tr, style: Theme.of(context).textTheme.titleLarge,),
          ),

          GestureDetector(
            onTap: (){
              controller.goToSearchPage();
            },
            child: Container(
              width: AppDimensions.screenWidth,
              height: AppDimensions.getHeight(45),
              margin: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(AppColors.kDefaultPadding)),
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(AppColors.kDefaultPadding)),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.kGreyColor),
                borderRadius: BorderRadius.circular(AppDimensions.getWidth(4)),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(AppAssets.search, color: AppColors.kGreyColor,),
                  SizedBox(width: AppDimensions.getWidth(12),),
                  Text('11'.tr, style: Theme.of(context).textTheme.titleSmall,)
                ],
              ),
            ),
          ),

          CustomLargeTitle(title: "popular-search".tr,),

          PopularSearchData(),
          // CustomLargeTitle(title: "recent-search".tr,),

        ],
      );
    });
  }
}


