import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_perks/components/default/custom_details_app_bar.dart';
import 'package:plate_perks/components/default/custom_rounded_button.dart';
import 'package:plate_perks/core/controllers/settings/language_controller.dart';
import 'package:plate_perks/models/settings/language_model.dart';
import 'package:plate_perks/utils/Dimensions/app_dimensions.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class LanguageSettings extends StatelessWidget {
   const LanguageSettings({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageController languageController = Get.find<LanguageController>();
    return Scaffold(
      appBar: customDetailsAppBar(context, title: 'lang'.tr),
      body: Obx((){
        return Padding(
          padding: EdgeInsets.only(top: AppDimensions.getHeight(16)),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(LanguageModel.languages.length, (index){
                  int langId = LanguageModel.languages[index].id;
                  String lang = LanguageModel.languages[index].language;
                  bool isSelected = languageController.selectedLanguage.value == lang;
                  return GestureDetector(
                    onTap: (){
                      languageController.selectLanguage(lang);
                      debugPrint(languageController.selectedLanguage.value);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(18),vertical: AppDimensions.getHeight(9)),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOutBack,
                            width: AppDimensions.getWidth(18),
                            height: AppDimensions.getHeight(18),
                            padding: EdgeInsets.all(AppDimensions.getWidth(3)),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1, color: isSelected ? AppColors.kPrimaryColor : AppColors.kGreyColor.withOpacity(0.4)),
                            ),
                            child: DecoratedBox(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isSelected ? AppColors.kPrimaryColor : Colors.transparent
                                )),
                          ),
                          SizedBox(width: AppDimensions.getWidth(16),),
                          Text('$langId'.tr)
                        ],
                      ),
                    ),
                  );
                }),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: AppDimensions.getHeight(20)),
                child: CustomRoundedButton(onTap: (){
                  languageController.changeLanguage(languageController.selectedLanguage.value);
                  debugPrint(languageController.language.languageCode);
                },
                    title: "change-language".tr
                ),
              ),

            ],
          ),
        );
      }),
    );
  }
}
