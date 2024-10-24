class CartResponseModel {
  final List<CartData> cart;

  CartResponseModel({required this.cart});

  factory CartResponseModel.fromJson(Map<String, dynamic> json) {
    var itemsFromJson = json['cart'] as List? ?? [];  // If null, default to an empty list

    List<CartData> cartItems = itemsFromJson.map((item) => CartData.fromJson(item)).toList();

    return CartResponseModel(cart: cartItems);
  }

  Map<String, dynamic> toJson() {
    return {
      'cart': cart.map((item) => item.toJson()).toList(),
    };
  }
}


class CartData {
  final int? food;
  final int? user;
  final bool? inCart;
  int quantity;

  CartData({
     this.food,
     this.user,
     this.inCart,
     required this.quantity,
  });

  factory CartData.fromJson(Map<String, dynamic> json) {
    return CartData(
      food: json['food'] as int,
      user: json['user'] as int,
      inCart: json['in_cart'] as bool,
      quantity: json['quantity'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'food': food,
      'user': user,
      'in_cart': inCart,
      'quantity': quantity,
    };
  }
}
