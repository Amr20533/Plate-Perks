import 'package:flutter/material.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    required this.controller,
    required this.title,
    required this.keyboardType,
    this.suffixIcon,
    this.hintText = '',
    this.obscureText = false,
    super.key,
  });

  final TextEditingController controller;
  final String title;
  final String hintText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxHeight: AppDimensions.getHeight(105),
      ),
      margin: EdgeInsets.symmetric(vertical: AppDimensions.getHeight(1), horizontal: AppDimensions.getWidth(AppColors.kDefaultPadding)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium,),
          const SizedBox(height: 11),
          SizedBox(
            height: 45,
            child: TextFormField(
              controller: controller,
              cursorHeight: 18,
              cursorColor: AppColors.kPrimaryColor,

              focusNode: FocusNode(),
              decoration: InputDecoration(
                hintText: hintText.isNotEmpty ? hintText : title,
                hintStyle: Theme.of(context).textTheme.titleSmall,
                border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1.5, color: AppColors.kGreyColor),
                  borderRadius: BorderRadius.circular(AppDimensions.getWidth(8))
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:const BorderSide(width: 1.5, color: AppColors.kGreyColor),
                      borderRadius: BorderRadius.circular(AppDimensions.getWidth(8))

                  ),
                focusedBorder: OutlineInputBorder(
                    borderSide:const BorderSide(width: 1.5, color: AppColors.kPrimaryColor),
                    borderRadius: BorderRadius.circular(AppDimensions.getWidth(8))
            ),
                suffixIcon: suffixIcon
              ),
              keyboardType: keyboardType,
              obscureText: obscureText,
            ),
          ),
        ],
      ),
    );
  }
}
