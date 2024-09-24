import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/components/auth/auth_text_field.dart';
import 'package:plate_perks/components/auth/custom_auth_header.dart';
import 'package:plate_perks/components/default/custom_rounded_button.dart';
import 'package:plate_perks/core/controllers/auth/login_controller.dart';
import 'package:plate_perks/models/auth/login_model.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>with TickerProviderStateMixin{
  late List<AnimationController> _animationControllers;
  late AnimationController _buttonAnimationController;
  late List<Animation<Offset>> _slideAnimations;
  late Animation<Offset> _buttonAnimation;

  @override
  void initState() {
    _animationControllers = List<AnimationController>.generate(6, (index) => AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    ),
    );
    _buttonAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _slideAnimations = _animationControllers.map((animation) {
      return Tween<Offset>(
        begin: const Offset(0, 1.0),
        end: const Offset(0, 0),
      ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          )
      );
    }).toList();
    _buttonAnimation = Tween<Offset>(
      begin: const Offset(0, -1.0),
      end: const Offset(0, 0),
    ).animate(
        CurvedAnimation(
          parent: _buttonAnimationController,
          curve: Curves.easeInOut,
        )
    );

    _animationControllers.map((animation) => animation.forward()).toList();
    _buttonAnimationController.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginController(loginRepo: Get.find(), appServices: Get.find(), ));
    return Scaffold(
      body: GetBuilder<LoginController>(builder: (login){
        return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomAuthHeader(title: '19'.tr,),


                  SlideTransition(
                    position: _slideAnimations[2],
                    child: AuthTextField(
                      controller: login.email,
                      title: '15'.tr,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SlideTransition(
                    position: _slideAnimations[3],
                    child: AuthTextField(
                      controller: login.password,
                      title: '16'.tr,
                      obscureText: login.isPassword,
                      suffixIcon: IconButton(
                          onPressed: (){
                            login.isPassword = !login.isPassword;
                          },
                          icon: Icon(login.isPassword ? Icons.visibility : Icons.visibility_off, color: login.isPassword ? AppColors.kGreyColor : AppColors.kPrimaryColor,)),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),


                  Padding(
                    padding: EdgeInsets.only(top: AppDimensions.getHeight(8), bottom: AppDimensions.getHeight(3)),
                    child: SlideTransition(
                      position: _buttonAnimation,
                      child: CustomRoundedButton(onTap: (){
                        LoginModel loginModel = LoginModel(
                            username: login.email.text,
                            password: login.password.text
                        );
                        login.userLogin(loginModel).then((response) {
                          debugPrint('${response.access}');
                        }).catchError((error) {
                          debugPrint('Login failed: $error');
                        });
                      },
                          title: '22'.tr),
                    ),
                  ),
                  SlideTransition(
                    position: _buttonAnimation,
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('17'.tr),
                        TextButton(onPressed: (){

                        },
                            child: Text('18'.tr, style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.kPrimaryColor),)),
                      ],
                    ),
                  ),
                ],),
            ));
      }),
    );
  }
}
