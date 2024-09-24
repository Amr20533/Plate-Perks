import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class ForgotPasswordController extends GetxController{
  late TextEditingController email;


  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}