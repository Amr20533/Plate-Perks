import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:plate_perks/end_point.dart';

class ApiHelper extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;
  late Map<String,String> _mainHeader;
  late Map<String,String> _header;
  ApiHelper({required this.appBaseUrl}){
    baseUrl = appBaseUrl;
    timeout=const Duration(seconds: 30);
    token = AppEndPoint.userToken;
    _mainHeader={
      'Content-type':'application/json; charset=UTF-8',
      'Authorization':'Bearer $token'
    };
    _header={
      'Content-type':'application/json',
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

  Future<Response> getAuthData(String uri)async{
    try{
      Response response=await get(uri, headers: _mainHeader);
      return response;
    }catch(e){
      return Response(statusCode: 1,statusText: e.toString());
    }
  }

  Future<Response> noAuthPostData(String uri,dynamic body)async{
    try {
      Response response = await post(
        uri,
        body is String ? jsonDecode(body) : body,
        headers: _header,
      );

      if(response.statusCode == 200 || response.statusCode == 201){
        debugPrint(response.toString());
        return response;
      }else{
        debugPrint("Failed To Post Data: $response");
        return response;
      }
    } catch (e) {
      debugPrint(e.toString());
      return Response(
        statusCode: 500,
        statusText: e.toString(),
      );
    }
  }

  Future<Response> postData(String uri,dynamic body)async{
    try {
      Response response = await post(
        uri,
        body is String ? jsonDecode(body) : body,
        headers: _mainHeader,
      );

      if(response.statusCode == 200 || response.statusCode == 201){
        debugPrint(response.toString());
        return response;
      }else{
        debugPrint("Failed To Post Data: $response");
        return response;
      }
    } catch (e) {
      debugPrint(e.toString());
      return Response(
        statusCode: 500,
        statusText: e.toString(),
      );
    }
  }

  Future<Response> deleteData(String uri) async {
    try {
      Response response = await delete(
        uri,
        headers: _mainHeader,
      );

      debugPrint(response.toString());
      return response;
    } catch (e) {
      debugPrint(e.toString());
      return Response(
        statusCode: 500,
        statusText: e.toString(),
      );
    }
  }

}