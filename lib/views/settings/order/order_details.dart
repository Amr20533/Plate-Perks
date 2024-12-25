import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/components/default/custom_details_app_bar.dart';
import 'package:plate_perks/components/default/custom_rounded_button.dart';
import 'package:plate_perks/components/features/orders/custom_order_view.dart';
import 'package:plate_perks/models/order/order_response_model.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, required this.orderItem});
  final OrderItem orderItem;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: customDetailsAppBar(context, title: 'order-detail'.tr),
      body:Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(AppColors.kDefaultPadding), ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("food".tr, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20)),
            CustomOrderView(orderItem: orderItem),
            Text("total".tr, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20)),
            SizedBox(height: AppDimensions.getHeight(16),),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("food".tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 16, color: Colors.black)),
                Text('\$${orderItem.price}', style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16)),

              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: AppDimensions.getHeight(120),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 18,
                  offset: const Offset(0, -1)
              )
            ]
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(AppColors.kDefaultPadding), ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                children: [
                  TextSpan(
                    text: '${'total'.tr}: ',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black, fontSize: 18)
                  ),
                  TextSpan(
                    text: '\$${orderItem.price}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 18)                ),
                ]
              )),
              SizedBox(height: AppDimensions.getHeight(20),),
              CustomRoundedButton(
                  onTap: (){

              },
                  title: "10".tr)
            ],
          ),
        ),
      ),
    );
  }
}



