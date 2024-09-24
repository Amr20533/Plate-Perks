import 'package:flutter/material.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/static/app_assets.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: SafeArea(child: SizedBox(
        width: double.infinity,
        height: AppDimensions.screenHeight,
        child: Stack(
          children: [
            Image.asset(AppAssets.circles),
            Align(
              alignment: Alignment.center,
              child: AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(milliseconds: 600),
                  child: Text('Plate Perks.', style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white),)),
            ),
            Positioned(
                bottom: AppDimensions.getHeight(130),
                right: AppDimensions.getWidth(0),
                child: Image.asset(AppAssets.dots)),
        ],),
      )),
    );
  }
}
