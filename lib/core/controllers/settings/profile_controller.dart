
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:plate_perks/core/repositories/settings/profile_repository.dart';
import 'package:plate_perks/core/services/app_services.dart';
import 'package:plate_perks/end_point.dart';
import 'package:plate_perks/models/settings/profile_response_model.dart';
import 'package:plate_perks/utils/states/data_status.dart';
import 'package:plate_perks/utils/static/routes.dart';

class ProfileController extends GetxController{
  final ProfileRepo profileRepo;
  final AppServices appServices;
  ProfileController({required this.profileRepo,required this.appServices});

  DataStatus dataStatus = DataStatus.loading;
  ProfileResponseModel profileResponseModel = ProfileResponseModel();

  @override
  void onInit() {
    super.onInit();
    getMyProfile();
  }


  Future<String> getMyProfile()async{
    dataStatus = DataStatus.loading;
    update();
    try{
      String token = appServices.getStorage.read(AppEndPoint.userToken);
      profileRepo.apiHelper.updateHeader(token);

      Response response = await profileRepo.getUserData();
      if(response.statusCode == 200){

        profileResponseModel = ProfileResponseModel.fromJson(response.body);
        dataStatus = DataStatus.success;
        update();
        return 'success';
      }else{
        dataStatus = DataStatus.failed;
        update();
        return 'failed';
      }
    }catch (e) {
      dataStatus = DataStatus.error;
      update();
      debugPrint('Error occurred While Getting Profile Data: $e');
      return 'Error $e';
    }
  }

  void logOut() {
    appServices.getStorage.remove(AppEndPoint.userToken);
    update();
    Get.offAndToNamed(AppRoutes.login);
  }

  @override
  void onClose() {
    super.onClose();
  }
}