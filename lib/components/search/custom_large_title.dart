import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class CustomLargeTitle extends StatelessWidget {
  const CustomLargeTitle({
    required this.title,
    super.key,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(AppColors.kDefaultPadding), vertical: AppDimensions.getHeight(AppColors.kDefaultPadding)),
      child: Text(title, style: Theme.of(context).textTheme.headlineSmall,),
    );
  }
}
