import 'dart:convert';
Order orderFromJson(String json) => Order.fromJson(jsonDecode(json));

class OrderResponseModel{
  final List<Order> orders;

  OrderResponseModel({required this.orders});

  factory OrderResponseModel.fromJson(Map<String,dynamic> json){
    var itemsFromJson = json['Orders'] as List? ?? []; 

    List<Order> orderItems = itemsFromJson.map((item) => Order.fromJson(item)).toList();

    return OrderResponseModel(orders: orderItems);
  }

  Map<String, dynamic> toJson() {
    return {
      'Orders': orders.map((item) => item.toJson()).toList(),
    };
  }
}


class Order {
  final int id;
  final String city;
  final String zipCode;
  final String street;
  final String state;
  final String phoneNo;
  final String country;
  final double totalAmount;
  final double totalPrice;
  final List<OrderItem> orderItems;
  final String paymentMode;
  final String paymentStatus;
  final String status;
  final DateTime createdAt;
  final int userId;

  Order({
    required this.id,
    required this.city,
    required this.zipCode,
    required this.street,
    required this.state,
    required this.phoneNo,
    required this.country,
    required this.totalAmount,
    required this.totalPrice,
    required this.orderItems,
    required this.paymentMode,
    required this.paymentStatus,
    required this.status,
    required this.createdAt,
    required this.userId,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      city: json['city'],
      zipCode: json['zip_code'],
      street: json['street'],
      state: json['state'],
      phoneNo: json['phone_no'],
      country: json['country'],
      totalAmount: json['total_amount'].toDouble(),
      totalPrice: json['total_price'].toDouble(),
      orderItems: (json['order'] as List)
          .map((item) => OrderItem.fromJson(item))
          .toList(),
      paymentMode: json['payment_mode'],
      paymentStatus: json['payment_status'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      userId: json['user'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'city': city,
      'zip_code': zipCode,
      'street': street,
      'state': state,
      'phone_no': phoneNo,
      'country': country,
      'total_amount': totalAmount,
      'total_price': totalPrice,
      'order': orderItems.map((item) => item.toJson()).toList(),
      'payment_mode': paymentMode,
      'payment_status': paymentStatus,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'user': userId,
    };
  }


}

class OrderItem {
  final int id;
  final String name;
  int quantity;
  final double price;
  final int foodId;
  final int orderId;

  OrderItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.foodId,
    required this.orderId,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'],
      price: double.parse(json['price']),
      foodId: json['food'],
      orderId: json['order'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'price': price,
      'food': foodId,
      'order': orderId,
    };
  }
}
