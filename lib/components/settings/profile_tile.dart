import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/data/profile_tiles_data.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';
import 'package:svg_flutter/svg.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.tile,
    this.isLast = false,
  });

  final ProfileTilesData tile;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: (){
            Get.toNamed(tile.path);
          },
          contentPadding: EdgeInsets.zero,
          minVerticalPadding: 0,
          minTileHeight: AppDimensions.getHeight(40),
          leading: SvgPicture.asset(tile.icon,color: AppColors.kGreyIconColor, width: 24, height: 24),
          title: Text(
            tile.title.tr,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 16, color: Colors.black),
          ),
          trailing: Icon(Icons.arrow_forward_ios, size: AppDimensions.getWidth(12), color: Colors.black,),
        ),
        !isLast ? Padding(
          padding:  EdgeInsets.only(left: AppDimensions.getWidth(AppColors.kDefaultPadding,)),
          child:const Divider(
            thickness: 1,
            color: AppColors.kDividerColor,
          ),
        ) : const SizedBox.shrink()
      ],
    );
  }
}
