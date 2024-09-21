import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/components/main/custom_food_card.dart';
import 'package:plate_perks/controllers/starter/search_controller.dart';
import 'package:plate_perks/end_point.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/static/app_assets.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SearchPageController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('search'.tr),
      ),
      body: GetBuilder<SearchPageController>(
          builder: (controller){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                  Expanded(
                    child: TextField(
                      controller: controller.searchController,
                      cursorColor: AppColors.kPrimaryColor,
                      autofocus: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: AppDimensions.getHeight(20),),
            controller.searchController.text.isNotEmpty ?  Container(
              height: AppDimensions.getHeight(268),
              margin: EdgeInsets.only(left: AppDimensions.getWidth(AppColors.kDefaultPadding)),
              child: Wrap(
                children: List.generate(controller.filteredFood.length, (page) => GestureDetector(
                  onTap: (){
                    _showBottomSheet();
                  },
                  child: CustomFoodCard(foodModel: controller.filteredFood[page],
                      image: '${AppEndPoint.server}${controller.filteredFood[page].images[page].image}'),
                )),
              ),
            ): Container()
          ],
        );
      }),
    );
  }
  void _showBottomSheet() {
    Get.bottomSheet(
      Container(
        width: double.infinity,
        height: AppDimensions.getHeight(600),
        decoration: BoxDecoration(
          color: Colors.white, // Dark background
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)), // Rounded edges
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "This is a bottom sheet",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.back(); // Close the bottom sheet
              },
              child: Text("Close"),
            ),
          ],
        ),
      ),
      isScrollControlled: false,
    );
  }

}
