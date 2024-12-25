import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:plate_perks/core/repositories/auth/sign_up_repository.dart';
import 'package:plate_perks/models/auth/signup_model.dart';
class SignupController extends GetxController{
  final SignUpRepo signupRepo;
  SignupController({required this.signupRepo});


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


  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool loading){
    _isLoading = loading;
    update();
  }

  Future<dynamic> userSignUp(SignUpModel signupModel) async {
    isLoading = true;
    Response response = await signupRepo.signup(body: signupModel.toJson());

   try{
     if (response.statusCode == 201) {
       isLoading = false;
       return true;

     } else {
       isLoading = false;
       debugPrint("Failed to Signup:");
       return false;
     }
   }catch (error){
     isLoading = false;
     throw Exception('An Error Occurred While Signup: $error');
   }
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