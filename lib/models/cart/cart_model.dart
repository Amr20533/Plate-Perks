class CartModel {
  final bool inCart;

  CartModel({
    required this.inCart,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      inCart: json['in_cart'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'in_cart': inCart,
    };
  }
}
