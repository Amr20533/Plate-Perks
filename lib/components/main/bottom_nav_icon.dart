import 'package:flutter/material.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';
import 'package:svg_flutter/svg_flutter.dart';

class BottomNavIcon extends StatelessWidget {
  const BottomNavIcon({
    required this.onTap,
    required this.label,
    required this.icon,
    this.isSelected = false,
    super.key,
  });
  final VoidCallback onTap;
  final String label;
  final String icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon,  color: isSelected ? AppColors.kPrimaryColor : AppColors.kGreyColor),
          SizedBox(height: AppDimensions.getHeight(3)),
          Text(label, style: Theme.of(context).textTheme.titleSmall!.copyWith(color: isSelected ? AppColors.kPrimaryColor : AppColors.kGreyColor),),
        ],
      ),
    );
  }
}
