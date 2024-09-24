import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/components/auth/auth_text_field.dart';
import 'package:plate_perks/components/auth/custom_auth_header.dart';
import 'package:plate_perks/components/default/custom_rounded_button.dart';
import 'package:plate_perks/core/controllers/auth/sign_up_controller.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> with TickerProviderStateMixin{
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
    Get.lazyPut(() => SignupController());
    return Scaffold(
      body: GetBuilder<SignupController>(builder: (signup){
        return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomAuthHeader(title: '18'.tr,),


                  SlideTransition(
                    position: _slideAnimations[0],
                    child: AuthTextField(
                        controller: signup.firstName,
                        title: '13'.tr,
                        keyboardType: TextInputType.name,
                    ),
                  ),
                  SlideTransition(
                    position: _slideAnimations[1],
                    child: AuthTextField(
                        controller: signup.lastName,
                        title: '14'.tr,
                        keyboardType: TextInputType.name,
                    ),
                  ),
                  SlideTransition(
                    position: _slideAnimations[2],
                    child: AuthTextField(
                        controller: signup.email,
                        title: '15'.tr,
                        keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SlideTransition(
                    position: _slideAnimations[3],
                    child: AuthTextField(
                        controller: signup.password,
                        title: '16'.tr,
                        obscureText: signup.isPassword,
                        suffixIcon: IconButton(
                            onPressed: (){
                              signup.isPassword = !signup.isPassword;
                            },
                            icon: Icon(signup.isPassword ? Icons.visibility : Icons.visibility_off, color: signup.isPassword ? AppColors.kGreyColor : AppColors.kPrimaryColor,)),
                        keyboardType: TextInputType.visiblePassword,
                    ),
                  ),


                  Padding(
                    padding: EdgeInsets.only(top: AppDimensions.getHeight(8), bottom: AppDimensions.getHeight(3)),
                    child: SlideTransition(
                      position: _buttonAnimation,
                      child: CustomRoundedButton(onTap: (){

                      },
                          title: '19'.tr),
                    ),
                  ),
                  SlideTransition(
                    position: _buttonAnimation,
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('21'.tr),
                        TextButton(onPressed: (){

                        },
                          child: Text('22'.tr, style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.kPrimaryColor),)),
                      ],
                    ),
                  ),
                ],),
            ));
      }),
    );
  }
}


