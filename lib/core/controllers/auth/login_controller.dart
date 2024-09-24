import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:plate_perks/core/dependencies/api_helper.dart';
import 'package:plate_perks/core/repositories/auth/login_repository.dart';
import 'package:plate_perks/core/services/app_services.dart';
import 'package:plate_perks/end_point.dart';
import 'package:plate_perks/models/auth/login_model.dart';
import 'package:plate_perks/models/auth/responses/login_response_model.dart';
class LoginController extends GetxController{
  final LoginRepo loginRepo;
  final AppServices appServices;
  LoginController({required this.loginRepo, required this.appServices});
  
  late TextEditingController email;
  late TextEditingController password;


  bool _isPassword = true;
  bool get isPassword => _isPassword;

  set isPassword(bool newPass){
    _isPassword = newPass;
    update();
  }

  Future<dynamic> userLogin(LoginModel loginModel) async {
    Response response = await loginRepo.login(body: loginModel.toJson());

    if (response.statusCode == 200) {
      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(response.body);
      appServices.getStorage.write(AppEndPoint.userToken, loginResponseModel.access);
      return loginResponseModel;

    } else {
      throw Exception('Failed to login: ${response.statusText}');
    }
  }


  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}