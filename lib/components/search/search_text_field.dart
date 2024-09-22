import 'package:flutter/material.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/static/app_assets.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    required this.searchController,
    super.key,
  });
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              controller: searchController,
              cursorColor: AppColors.kPrimaryColor,
              // autofocus: true,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}