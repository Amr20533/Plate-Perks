import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/components/placeholder/data_receiver_status_view.dart';
import 'package:plate_perks/components/settings/profile_header.dart';
import 'package:plate_perks/core/controllers/settings/profile_controller.dart';
import 'package:plate_perks/components/settings/profile_tile.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/data/profile_tiles_data.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: Get.find<ProfileController>(),
        builder: (controller){
         return Scaffold(
        body: DataReceiverStateView(
          status: controller.dataStatus,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(20)),
            child: ListView(
              children: [
                ProfileHeader(profileResponseModel: controller.profileResponseModel,),
                Text('account'.tr, style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black)),
                Padding(
                  padding: EdgeInsets.only(top: AppDimensions.getHeight(15)),
                  child: Column(
                    children: List.generate(ProfileTilesData.account.length, (index) {
                      final tile = ProfileTilesData.account[index];
                      bool isLast = index == ProfileTilesData.account.length -1;
                      return ProfileTile(tile: tile, isLast: isLast,);
                    })),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppDimensions.getHeight(15)),
                  child: Text('more-info'.tr, style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black),),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: AppDimensions.getHeight(15)),
                  child: Column(
                      children: List.generate(ProfileTilesData.info.length, (index) {
                        final tile = ProfileTilesData.info[index];
                        bool isLast = index == ProfileTilesData.info.length -1;
                        return ProfileTile(tile: tile, isLast: isLast,);
                      })),
                ),
                Center(
                  child: TextButton(onPressed: () {
                    controller.logOut();
                  },
                    child: Text("44".tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.kLightRedColor),)),
                ),
                SizedBox(height: AppDimensions.getHeight(15),)
              ],
            ),
          ),
        ),
      );
    });
  }
}



