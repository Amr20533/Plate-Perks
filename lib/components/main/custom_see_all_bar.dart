import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class CustomSeeAllBar extends StatelessWidget {
  const CustomSeeAllBar({
    required this.onPressed,
    required this.text,
    super.key,
  });

  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: AppDimensions.getHeight(14), start: AppDimensions.getWidth(AppColors.kDefaultPadding)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: Theme.of(context).textTheme.headlineSmall,),
          TextButton(
              onPressed: onPressed,
              child: Row(
                children: [
                  Text('see-all'.tr, style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.kPrimaryColor),),
                  SizedBox(width: AppDimensions.getWidth(8)),
                  Icon(Icons.arrow_forward_ios, color: AppColors.kPrimaryColor,size: AppDimensions.getWidth(12),),
                ],
              ))
        ],
      ),
    );
  }
}
