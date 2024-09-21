import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class PopularSearchData extends StatelessWidget {
  PopularSearchData({
    super.key,
  });

  final List<String> popularSearches = ['duo-table', 'noodle','chicken', 'fried-rice', 'meat', 'family'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(AppColors.kDefaultPadding),),
      child: Wrap(
          children:List.generate(popularSearches.length, (int page) => Container(
            // width: AppDimensions.getWidth(80),
            height: AppDimensions.getWidth(30),
            // alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(10),vertical: AppDimensions.getWidth(10),),
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(12),vertical: AppDimensions.getWidth(3),),
            decoration: BoxDecoration(
                color: AppColors.kLightGreyColor,
                borderRadius: BorderRadius.circular(AppDimensions.getWidth(16))
            ),
            child: Text(popularSearches[page].tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 14),),
          )
          )
      ),
    );
  }
}
