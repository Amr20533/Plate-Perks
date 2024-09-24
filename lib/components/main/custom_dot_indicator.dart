import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/core/controllers/starter/main_page_controller.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class CustomDotIndicator extends StatelessWidget {
  const CustomDotIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(builder: (controller){
      return Padding(
        padding: EdgeInsets.only(top: AppDimensions.getHeight(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: controller.currentPage == index ? AppColors.kPrimaryColor : AppColors.kGreyColor,
                borderRadius: BorderRadius.circular(5),
              ),
            );
          }),
        ),
      );
    });
  }
}
