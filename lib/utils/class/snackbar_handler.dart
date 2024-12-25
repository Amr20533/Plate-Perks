import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/components/default/custom_rounded_button.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/static/routes.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class SnackBarHandler{
  BuildContext customContext = Get.context!;
  
  void showCartSnackBar() {
    Get.showSnackbar(
        GetSnackBar(
          messageText: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("place_order".tr, style: Theme.of(customContext).textTheme.titleMedium!.copyWith(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),),
                CustomRoundedButton(onTap: (){
                  Get.toNamed(AppRoutes.cart);
                },
                  width: AppDimensions.getWidth(60),
                  height: AppDimensions.getHeight(31),
                  bgColor: Colors.white,
                  textColor: AppColors.kPrimaryColor,
                  title: "cart".tr,
                ),
              ],
            ),
          ),

          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.kSnackBarColor,
          borderRadius: 6,
          // colorText: Colors.white,
          // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          margin: const EdgeInsets.all(10),
          borderColor: AppColors.kSnackBarColor,
          borderWidth: 1,
          animationDuration: const Duration(milliseconds: 300),
          duration: const Duration(seconds: 3),
        )
    );
  }

}