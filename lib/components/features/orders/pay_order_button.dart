import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/components/default/custom_rounded_button.dart';
import 'package:plate_perks/core/controllers/features/order_controller.dart';
import 'package:plate_perks/models/food_model.dart';
import 'package:plate_perks/models/order/order_model.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/states/data_status.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class PayOrderButton extends StatelessWidget {
  const PayOrderButton({
    super.key,
    required this.cartIndex,
    required this.foodData,
  });

  final int cartIndex;
  final FoodData foodData;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
        id: 'cart_quantity_counter_$cartIndex',
        builder: (controller){
          return Container(
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
                              // text: '\$30',
                                text: '\$${(controller.cart[cartIndex].quantity * double.parse(foodData.price)).round()}',
                                style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 18)                ),
                          ]
                      )),
                  SizedBox(height: AppDimensions.getHeight(20),),
                  CustomRoundedButton(onTap: (){
                    OrderModel orderModel = OrderModel(
                        city: controller.city.text,
                        zipCode: controller.zipCode.text, 
                        street: controller.street.text, 
                        state: controller.state.text, 
                        phoneNo: controller.phoneNumber.text,
                        country: controller.country.text,
                        orderItems: [
                          FoodOrderItem(food: foodData.id,
                              quantity: controller.cart[cartIndex].quantity,
                              price: double.parse(foodData.price)
                          )
                        ]
                    );
                    debugPrint("Order : ${orderModel.toJson()}");

                    controller.makeFoodOrder(orderModel: orderModel).then((orderResponse){
                      debugPrint("Order Created");
                      controller.checkOut(id: orderResponse.id).then((checkoutStatus){
                        if(checkoutStatus.url.isNotEmpty){
                          debugPrint("Checkout Success");
                        }else{
                          debugPrint("Checkout Failed");
                        }
                      });
                    });
                  },
                      title: "pay-now".tr,
                      loading: controller.orderStatus == DataStatus.loading ? true : false,
                  )
                ],
              ),
            ),
          );
        });
  }
}
