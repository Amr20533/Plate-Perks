import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/static/app_assets.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';
import 'package:svg_flutter/svg_flutter.dart';

class EmptyFavorites extends StatelessWidget {
  const EmptyFavorites({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.emptyFavorite, width: AppDimensions.getWidth(130),height: AppDimensions.getHeight(140),),
              Container(
                  width: AppDimensions.getWidth(340),
                  margin: EdgeInsets.only(top: AppDimensions.getHeight(AppColors.kDefaultPadding), bottom: AppDimensions.getHeight(AppColors.kDefaultPadding * 2)),
                  child: Text('empty_favorite'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 24),textAlign: TextAlign.center)),
            ]
        ));
  }
}

