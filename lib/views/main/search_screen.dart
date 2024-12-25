import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/components/main/custom_food_card.dart';
import 'package:plate_perks/components/main/custom_restaurant_card.dart';
import 'package:plate_perks/components/search/search_text_field.dart';
import 'package:plate_perks/core/controllers/features/cart_controller.dart';
import 'package:plate_perks/core/controllers/starter/search_controller.dart';
import 'package:plate_perks/end_point.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/class/bottom_sheet_handler.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

import '../../models/food_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=> CartController(cartRepo: Get.find(), appServices: Get.find()));
    Get.find<SearchPageController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('search'.tr),
      ),
      body: GetBuilder<SearchPageController>(
          builder: (controller){
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchTextField(searchController: tabController.index == 0 ? controller.searchController : controller.searchRestaurantController),
              SizedBox(height: AppDimensions.getHeight(20),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(AppColors.kDefaultPadding),),
                child: TabBar(
                    controller: tabController,
                    dividerColor: AppColors.kGreyColor,
                    dividerHeight: 0.3,
                    indicatorColor: AppColors.kPrimaryColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: Theme.of(context).textTheme.titleMedium,
                    labelColor: AppColors.kPrimaryColor,
                    unselectedLabelColor: AppColors.kGreyColor,
                    indicatorWeight: 3,
                    tabs: [
                      Text("food".tr, ),
                      Text("restaurant".tr,),
                    ]),
              ),
              Container(
                  height: AppDimensions.screenHeight * 0.72,
                  margin: EdgeInsets.only(top: AppDimensions.getHeight(AppColors.kDefaultPadding)),
                  child: TabBarView(
                      controller: tabController,
                      children: [
                        controller.searchController.text.isNotEmpty ?  Container(
                          height: AppDimensions.getHeight(268),
                          margin: EdgeInsets.only(left: AppDimensions.getWidth(AppColors.kDefaultPadding)),
                          child: Wrap(
                            children: List.generate(controller.filteredFood.length, (page) => GestureDetector(
                              onTap: (){
                                debugPrint('Food id:: ${controller.filteredFood[page].id}');
                                BottomSheetHandler().foodBottomSheet(foodData: controller.filteredFood[page]);
                              },
                              child: Padding(
                                padding: EdgeInsetsDirectional.only(end: AppDimensions.getWidth(6)),
                                child: CustomFoodCard(
                                    favTap: (){

                                    },
                                    foodModel: controller.filteredFood[page],
                                    image: '${AppEndPoint.server}${controller.filteredFood[page].images[0].image}'),
                              ),
                            )),
                          ),
                        ): Container(),
                        controller.searchRestaurantController.text.isNotEmpty ?  Container(
                          height: AppDimensions.getHeight(268),
                          margin: EdgeInsets.only(left: AppDimensions.getWidth(AppColors.kDefaultPadding)),
                          child: Wrap(
                            children: List.generate(controller.filteredRestaurant.length, (page) => GestureDetector(
                              onTap: (){
                                // _showBottomSheet();
                              },
                              child: CustomRestaurantCard(restaurantData: controller.filteredRestaurant[page],
                                  image: '${AppEndPoint.server}${controller.filteredRestaurant[page].images[page].image}'),
                            )),
                          ),
                        ): Container()
          
                      ])),
          
            ],
          ),
        );
      }),
    );
  }

}



