import 'package:plate_perks/models/Favorites/responses/favorite_response_model.dart';

class FoodModel{
  final List<FoodData> data;

  FoodModel({required this.data});

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      data: List<FoodData>.from(
          json['data'].map((data) => FoodData.fromJson(data))
      ),
    );
  }


}

class FoodData {
  final int id;
  final List<Review> reviews;
  final List<ImageModel> images;
  final List<dynamic> cart;
  final List<FavoriteItem> favorites;
  final String name;
  final String description;
  final String price;
  final String category;
  final String ratings;
  final String ingredients;
  final int calories;
  final String protein;
  final String fat;
  final String carbohydrates;
  final int preparationTime;
  final String discount;
  final DateTime availableFrom;
  final DateTime availableTo;
  final DateTime createdAt;
  final int user;

  FoodData({
    required this.id,
    required this.reviews,
    required this.images,
    required this.cart,
    required this.favorites,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.ratings,
    required this.ingredients,
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbohydrates,
    required this.preparationTime,
    required this.discount,
    required this.availableFrom,
    required this.availableTo,
    required this.createdAt,
    required this.user,
  });

  factory FoodData.fromJson(Map<String, dynamic> json) {
    return FoodData(
      id: json['id'],
      reviews: (json['reviews'] as List)
          .map((review) => Review.fromJson(review))
          .toList(),
      images: (json['images'] as List)
          .map((image) => ImageModel.fromJson(image))
          .toList(),
      cart: json['cart'] ?? [],
      favorites: List<FavoriteItem>.from(
          json['favorites'].map((favorite) => FavoriteItem.fromJson(favorite))
      ),
      name: json['name'],
      description: json['description'],
      price: json['price'],
      category: json['category'],
      ratings: json['ratings'],
      ingredients: json['ingredients'],
      calories: json['calories'],
      protein: json['protein'],
      fat: json['fat'],
      carbohydrates: json['carbohydrates'],
      preparationTime: json['preparation_time'],
      discount: json['discount'],
      availableFrom: DateTime.parse(json['available_from']),
      availableTo: DateTime.parse(json['available_to']),
      createdAt: DateTime.parse(json['created_at']),
      user: json['user'],
    );
  }
}

class Review {
  // Define fields based on your review structure
  // Example: final int rating;

  Review(); // Add a constructor and methods as needed

  factory Review.fromJson(Map<String, dynamic> json) {
    // Parse the review data
    return Review();
  }
}

class ImageModel {
  final int id;
  final String image;
  final int food;

  ImageModel({
    required this.id,
    required this.image,
    required this.food,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      image: json['image'],
      food: json['food'],
    );
  }
}
