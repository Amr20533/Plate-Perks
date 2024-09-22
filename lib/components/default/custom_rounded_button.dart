
import 'package:flutter/material.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton({
    required this.onTap,
    required this.title,
    super.key,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: AppDimensions.getWidth(360),
          height: AppDimensions.getWidth(45),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.getWidth(8)),
              color: AppColors.kPrimaryColor
          ),
          child: Text(title, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
        ));
  }
}
