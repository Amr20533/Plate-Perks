import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/components/default/custom_rounded_button.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/static/app_assets.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({
    required this.title,
    super.key,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.screenHeight * 0.72,
      child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppAssets.empty),
                Container(
                    width: AppDimensions.getWidth(340),
                    margin: EdgeInsets.only(top: AppDimensions.getHeight(AppColors.kDefaultPadding), bottom: AppDimensions.getHeight(AppColors.kDefaultPadding * 2)),
                    child: Text('empty'.tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 24),textAlign: TextAlign.center)),
                CustomRoundedButton(onTap: (){}, title: title),
              ]
          )),
    );
  }
}

