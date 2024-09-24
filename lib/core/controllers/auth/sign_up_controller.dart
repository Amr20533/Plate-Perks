import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class SignupController extends GetxController{
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController password;

  bool _isPassword = true;
  bool get isPassword => _isPassword;

  set isPassword(bool newPass){
    _isPassword = newPass;
    update();
  }

  @override
  void onInit() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
}