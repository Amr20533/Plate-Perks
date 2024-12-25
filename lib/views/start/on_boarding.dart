import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/components/default/custom_bordered_button.dart';
import 'package:plate_perks/components/default/custom_rounded_button.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/static/routes.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Container(
        width: double.infinity,
        height: AppDimensions.screenHeight,
        margin: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(AppColors.kDefaultPadding)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Plate Perks.', style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColors.kPrimaryColor),),
              Container(
                width: AppDimensions.getWidth(320),
                margin: EdgeInsets.only(top: AppDimensions.getHeight(12), bottom: AppDimensions.getHeight(150)),
                child: Text('9'.tr, style: Theme.of(context).textTheme.titleMedium,
                )
            ),
            CustomRoundedButton(
                onTap: (){
                  Get.toNamed(AppRoutes.signup);
                },
                width: double.infinity,
                title: '18'.tr
            ),
            SizedBox(height: AppDimensions.getHeight(AppColors.kDefaultPadding),),
            CustomBorderedButton(
                onTap: (){
                  Get.toNamed(AppRoutes.login);
                },
                title: '22'.tr
            ),
          ],
        ),
      )),
    );
  }
}
