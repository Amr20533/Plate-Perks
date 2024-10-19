import 'package:get/get.dart';
import 'package:plate_perks/core/dependencies/api_helper.dart';
import 'package:plate_perks/end_point.dart';

class ProfileRepo extends GetxService{
  final ApiHelper apiHelper;
  ProfileRepo({required this.apiHelper});

  Future<Response> getUserData()async{
    return await apiHelper.getAuthData(AppEndPoint.getMe);
  }


}