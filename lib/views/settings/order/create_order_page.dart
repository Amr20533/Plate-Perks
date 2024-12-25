import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/components/auth/auth_text_field.dart';
import 'package:plate_perks/components/default/custom_details_app_bar.dart';
import 'package:plate_perks/components/features/orders/order_info_bar.dart';
import 'package:plate_perks/components/features/orders/pay_order_button.dart';
import 'package:plate_perks/components/placeholder/data_receiver_status_view.dart';
import 'package:plate_perks/core/controllers/features/order_controller.dart';
import 'package:plate_perks/core/controllers/settings/profile_controller.dart';
import 'package:plate_perks/models/cart/cart_response_model.dart';
import 'package:plate_perks/models/food_model.dart';
import 'package:plate_perks/views/settings/order/checkout/checkout_view.dart';

class CreateOrderPage extends StatelessWidget {
  const CreateOrderPage({super.key, required this.foodData, required this.cartData, required this.cartIndex});
  final FoodData foodData;
  final CartData cartData;
  final int cartIndex;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
        builder: (controller){
        return controller.checkoutUrl.contains("http") ? CheckoutView(url: controller.checkoutUrl) : Scaffold(
          appBar: customDetailsAppBar(context, title: 'order'.tr),
          body: GetBuilder<ProfileController>(
            builder: (profileController){
              controller.phoneNumber.text =  profileController.profileResponseModel.profileInfo!.phoneNumber!.isNotEmpty ? profileController.profileResponseModel.profileInfo!.phoneNumber! : "";
              return DataReceiverStateView(
                status: profileController.dataStatus,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      OrderInfoBar(controller: controller,foodData: foodData, cartIndex: cartIndex),
                      AuthTextField(
                          controller: controller.country,
                          title: "country".tr,
                          hintText: "",
                          keyboardType: TextInputType.text
                      ), AuthTextField(
                          controller: controller.city,
                          title: "city".tr,
                          hintText: "",
                          keyboardType: TextInputType.text
                      ),
                      AuthTextField(
                          controller: controller.state,
                          title: "state".tr,
                          hintText: "",
                          keyboardType: TextInputType.text
                      ),
                      AuthTextField(
                          controller: controller.street,
                          title: "street".tr,
                          hintText: "",
                          keyboardType: TextInputType.text
                      ),
                      AuthTextField(
                          controller: controller.phoneNumber,
                          title: "20".tr,
                          hintText: controller.phoneNumber.text,
                          keyboardType: TextInputType.number
                      ),
                      AuthTextField(
                          controller: controller.zipCode,
                          title: "zip-code".tr,
                          keyboardType: TextInputType.number
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          bottomNavigationBar: controller.checkoutUrl.contains("https://checkout.stripe.com") ? Container() : PayOrderButton(cartIndex: cartIndex, foodData: foodData)
        );
      }
    );
  }
}


