import 'dart:convert';
CheckoutResponseModel checkoutResponseModelFromJson(String json) => CheckoutResponseModel.fromJson(jsonDecode(json));

class CheckoutResponseModel {
  final String url;

  CheckoutResponseModel({
    required this.url,
  });

  factory CheckoutResponseModel.fromJson(Map<String, dynamic> json) {
    return CheckoutResponseModel(
      url: json['url'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'url': url,
    };
  }
}
