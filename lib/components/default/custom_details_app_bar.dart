import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';

AppBar customDetailsAppBar(BuildContext context, {required String title}) {
  return AppBar(
      centerTitle: true,
      leading: IconButton(onPressed: Get.back,
          padding: EdgeInsets.zero,
          icon: Icon(Icons.arrow_back_ios, size: AppDimensions.getWidth(20),)),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium,)
  );
}
