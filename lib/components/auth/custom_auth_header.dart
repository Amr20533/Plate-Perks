import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class CustomAuthHeader extends StatelessWidget {
  const CustomAuthHeader({
    required this.title,
    super.key,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: AppDimensions.getWidth(55),
        margin: EdgeInsets.only(bottom: AppDimensions.getHeight(AppColors.kDefaultPadding * 1.5)),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.032),
                  blurRadius: 26,
                  offset: const Offset(0, 16)
              )
            ]
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 6,),
            IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_rounded, color: Colors.black, size: 27,)),
            const SizedBox(width: 6,),
            Text(title, style: Theme.of(context).textTheme.titleLarge,),
          ],
        ));
  }
}
