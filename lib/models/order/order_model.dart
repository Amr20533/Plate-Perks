class OrderModel {
  final String city;
  final String zipCode;
  final String street;
  final String state;
  final String phoneNo;
  final String country;
  final List<FoodOrderItem> orderItems;

  OrderModel({
    required this.city,
    required this.zipCode,
    required this.street,
    required this.state,
    required this.phoneNo,
    required this.country,
    required this.orderItems,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    var items = json['orderItems'] as List;
    List<FoodOrderItem> orderItemList =
    items.map((i) => FoodOrderItem.fromJson(i)).toList();

    return OrderModel(
      city: json['city'],
      zipCode: json['zip_code'],
      street: json['street'],
      state: json['state'],
      phoneNo: json['phone_no'],
      country: json['country'],
      orderItems: orderItemList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'zip_code': zipCode,
      'street': street,
      'state': state,
      'phone_no': phoneNo,
      'country': country,
      'orderItems': orderItems.map((item) => item.toJson()).toList(),
    };
  }
}

class FoodOrderItem {
  final int food;
  final int quantity;
  final double price;

  FoodOrderItem({
    required this.food,
    required this.quantity,
    required this.price,
  });

  factory FoodOrderItem.fromJson(Map<String, dynamic> json) {
    return FoodOrderItem(
      food: json['food'],
      quantity: json['quantity'],
      price: json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'food': food,
      'quantity': quantity,
      'price': price,
    };
  }
}
