class CartResponseModel {
  final List<CartData> cart;

  CartResponseModel({required this.cart});

  factory CartResponseModel.fromJson(Map<String, dynamic> json) {
    var itemsFromJson = json['cart'] as List;
    List<CartData> cartItems = itemsFromJson.map((item) => CartData.fromJson(item)).toList();

    return CartResponseModel(cart: cartItems);
  }

  Map<String, dynamic> toJson() {
    return {
      'items': cart.map((item) => item.toJson()).toList(),
    };
  }
}

class CartData {
  final int? food;
  final int? user;
  final bool? inCart;

  CartData({
     this.food,
     this.user,
     this.inCart,
  });

  factory CartData.fromJson(Map<String, dynamic> json) {
    return CartData(
      food: json['food'] as int,
      user: json['user'] as int,
      inCart: json['in_cart'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'food': food,
      'user': user,
      'in_cart': inCart,
    };
  }
}
