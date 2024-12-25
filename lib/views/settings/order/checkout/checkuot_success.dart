import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:plate_perks/components/default/custom_rounded_button.dart';
import 'package:plate_perks/components/search/custom_large_title.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/static/app_assets.dart';
import 'package:plate_perks/utils/static/routes.dart';

class CheckoutSuccess extends StatelessWidget {
  const CheckoutSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(AppAssets.success, width: AppDimensions.getWidth(180), height: AppDimensions.getHeight(180)),
            CustomLargeTitle(title: "success_payment".tr),
            SizedBox(
                width: AppDimensions.getWidth(290),
                child: Text("success_purchase".tr, style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14),textAlign: TextAlign.center,),),
            SizedBox(height: AppDimensions.getHeight(40),),
            CustomRoundedButton(
                onTap: (){
                  Get.toNamed(AppRoutes.main);
              },
                title: "back_home".tr
            ),
          ],
        ),
      ),
    );
  }
}
