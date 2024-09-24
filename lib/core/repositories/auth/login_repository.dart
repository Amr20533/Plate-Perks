import 'package:get/get.dart';
import 'package:plate_perks/core/dependencies/api_helper.dart';
import 'package:plate_perks/end_point.dart';

class LoginRepo extends GetxService{
  final ApiHelper apiHelper;
  LoginRepo({required this.apiHelper});

  Future<Response> login({required Map<String, dynamic> body})async{
    return await apiHelper.postData(
        AppEndPoint.login,
        body,
    );
  }


}