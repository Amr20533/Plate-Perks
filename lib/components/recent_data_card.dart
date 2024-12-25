import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/core/controllers/starter/recent_controller.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class RecentDataCard extends StatelessWidget {
  const RecentDataCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.find<RecentController>();
    return GetBuilder<RecentController>(builder: (controller){
      return ListView.separated(
          itemCount: 5,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: AppDimensions.getWidth(90),
                width: AppDimensions.getWidth(90),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimensions.getWidth(12)),
                    color: Colors.blueGrey
                  // image: DecorationImage(
                  //     fit: BoxFit.cover,
                  //     image: NetworkImage())
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(14)),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Name', style: Theme.of(context).textTheme.titleMedium,),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: AppDimensions.getWidth(3)),
                      child: Text('23 August 2021, 15:32', style: Theme.of(context).textTheme.titleSmall,),
                    ),
                    Text('Work Table . 1 Flower', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black, fontWeight: FontWeight.w500),),
                  ],
                ),
              ),
              const Spacer(),
              Text(index.isOdd && index % 3 == 0 ?'done'.tr : index % 2 == 0 ?'process'.tr : 'cancel'.tr, style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.kPrimaryColor),),

            ],
          ), separatorBuilder: (context, index) => const SizedBox(height: 6,));
    });
  }
}
