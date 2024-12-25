import 'package:get/get.dart';
import 'package:plate_perks/core/dependencies/api_helper.dart';
import 'package:plate_perks/end_point.dart';

class SignUpRepo extends GetxService{
  final ApiHelper apiHelper;
  SignUpRepo({required this.apiHelper});

  Future<Response> signup({required Map<String, dynamic> body})async{
    return await apiHelper.noAuthPostData(
      AppEndPoint.signup,
      body,
    );
  }
///Areej@safwa.com
///Areej113113

}