class RestaurantModel {
  final List<RestaurantData> data;

  RestaurantModel({required this.data});

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      data: List<RestaurantData>.from(
        json['data'].map((item) => RestaurantData.fromJson(item)),
      ),
    );
  }
}

class RestaurantData {
  final int id;
  final List<Table> table;
  final List<dynamic> favorite;
  final List<dynamic> review;
  final List<RestaurantImage> images;
  final String name;
  final String address;
  final String city;
  final String state;
  final String postalCode;
  final String phoneNumber;
  final String email;
  final String cuisineType;
  final String openingHour;
  final String description;
  final String ratings;
  final String priceRange;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int user;

  RestaurantData({
    required this.id,
    required this.table,
    required this.favorite,
    required this.review,
    required this.images,
    required this.name,
    required this.address,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.phoneNumber,
    required this.email,
    required this.cuisineType,
    required this.openingHour,
    required this.description,
    required this.ratings,
    required this.priceRange,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory RestaurantData.fromJson(Map<String, dynamic> json) {
    return RestaurantData(
      id: json['id'],
      table: List<Table>.from(json['table'].map((item) => Table.fromJson(item))),
      favorite: json['favorite'] ?? [],
      review: json['review'] ?? [],
      images: List<RestaurantImage>.from(json['images'].map((item) => RestaurantImage.fromJson(item))),
      name: json['name'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postal_code'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      cuisineType: json['cuisine_type'],
      openingHour: json['opening_hour'],
      description: json['description'],
      ratings: json['ratings'],
      priceRange: json['price_range'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      user: json['user'],
    );
  }
}

class Table {
  final int id;
  final int time;
  final String addition;
  final String table;
  final DateTime createdAt;
  final int restaurant;

  Table({
    required this.id,
    required this.time,
    required this.addition,
    required this.table,
    required this.createdAt,
    required this.restaurant,
  });

  factory Table.fromJson(Map<String, dynamic> json) {
    return Table(
      id: json['id'],
      time: json['time'],
      addition: json['addition'],
      table: json['table'],
      createdAt: DateTime.parse(json['created_at']),
      restaurant: json['restaurant'],
    );
  }
}

class RestaurantImage {
  final int id;
  final String image;
  final int restaurant;

  RestaurantImage({
    required this.id,
    required this.image,
    required this.restaurant,
  });

  factory RestaurantImage.fromJson(Map<String, dynamic> json) {
    return RestaurantImage(
      id: json['id'],
      image: json['image'],
      restaurant: json['restaurant'],
    );
  }
}
