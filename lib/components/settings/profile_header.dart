import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:plate_perks/end_point.dart';
import 'package:plate_perks/models/settings/profile_response_model.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/static/app_assets.dart';
import 'package:plate_perks/utils/static/routes.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.profileResponseModel,
  });
  final ProfileResponseModel profileResponseModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppDimensions.getHeight(40)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: AppDimensions.getHeight(10),bottom: AppDimensions.getHeight(20)),
            child: Text(
                'prof'.tr,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: AppDimensions.getWidth(20))
            ),
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage('${AppEndPoint.server}${profileResponseModel.profileInfo!.image}'),
                // child: CachedNetworkImage(
                //   imageUrl: '${AppEndPoint.server}${controller.profileResponseModel.profileInfo.image}',
                //   placeholder: (context, url) => CircularProgressIndicator(), // Placeholder while loading
                //   errorWidget: (context, url, error) => Icon(Icons.error), // Widget for error state
                // ),
              ),

              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(14)),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '${profileResponseModel.firstName} ${profileResponseModel.lastName}',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: AppDimensions.getWidth(20))
                      ),Text(
                        profileResponseModel.email!,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: AppDimensions.getWidth(16)),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Get.toNamed(AppRoutes.editProfile);
                },
                child: Row(
                  children: [
                    Image.asset(AppAssets.edit),
                    SizedBox(width: AppDimensions.getWidth(6),),
                    Text(
                      'edit'.tr,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: AppDimensions.getWidth(14), color: Colors.black),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
