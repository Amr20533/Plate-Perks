
import 'package:flutter/material.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton({
    required this.onTap,
    required this.title,
    this.padding = EdgeInsets.zero,
    this.bgColor = AppColors.kPrimaryColor,
    this.textColor = Colors.white,
    this.width = 360,
    this.height = 45,
    this.loading = false,
    super.key,
  });

  final double width;
  final double height;
  final EdgeInsetsGeometry padding;
  final String title;
  final VoidCallback onTap;
  final Color bgColor;
  final Color textColor;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          padding: padding,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.getWidth(8)),
              color: bgColor
          ),
          child: loading ? const CircularProgressIndicator(color: Colors.white,) : Text(title, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: textColor),),
        ));
  }
}
