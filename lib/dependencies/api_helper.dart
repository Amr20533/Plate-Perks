import 'package:get/get.dart';
import 'package:plate_perks/end_point.dart';

class ApiHelper extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;
  late Map<String,String> _mainHeader;
  ApiHelper({required this.appBaseUrl}){
    baseUrl = appBaseUrl;
    timeout=const Duration(seconds: 30);
    token = AppEndPoint.userToken;
    _mainHeader={
      'Content-type':'application/json; charset=UTF-8',
      'Authorization':'Bearer $token'
    };
  }
  updateHeader(String token){
    _mainHeader = {
      'Content-type':'application/json; charset=UTF-8',
      'Authorization':'Bearer $token'
    };
  }
  Future<Response> getData(String uri)async{
    try{
      Response response=await get(uri);
      return response;
    }catch(e){
      return Response(statusCode: 1,statusText: e.toString());
    }
  }
  Future<Response> postData(String uri,dynamic body)async{
    try{
      Response response = await post(uri, body,headers: _mainHeader);
      print(response.toString());
      return response;
    }catch(e){
      print(e.toString());
      return Response(statusCode: 1 , statusText: e.toString());
    }
  }
}