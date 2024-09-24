import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/components/recent_data_card.dart';
import 'package:plate_perks/core/controllers/starter/recent_controller.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class RecentView extends StatefulWidget {
  const RecentView({super.key});

  @override
  State<RecentView> createState() => _RecentViewState();
}

class _RecentViewState extends State<RecentView> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(20)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('recent'.tr, style: Theme.of(context).textTheme.headlineSmall,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppDimensions.getWidth(20)),
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
              Text("new".tr, ),
              Text("old".tr,),
            ]),
          ),
          SizedBox(
              height: AppDimensions.screenHeight * 0.72,
              child: TabBarView(
                  controller: tabController,
                  children: List.generate(2, (index) => const RecentDataCard())))
          // SizedBox(
          //   height: AppDimensions.screenHeight,
          //   child: PageView.builder(
          //   itemCount: 2,
          //   itemBuilder: (context, index) {
          //     return const RecentDataCard();
          //   }),
          // ),


        ],
      ),
    );  }
}

