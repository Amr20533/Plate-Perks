class CartModel {
  final bool inCart;
  final int quantity;

  CartModel({
    required this.inCart,
    required this.quantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      inCart: json['in_cart'] as bool,
      quantity: json['quantity'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'in_cart': inCart,
      'quantity': quantity,
    };
  }
}
