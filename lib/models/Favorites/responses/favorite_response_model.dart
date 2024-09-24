
class FavoriteResponseModel {
  List<FavoriteItem> favorites;

  FavoriteResponseModel({required this.favorites});

  factory FavoriteResponseModel.fromJson(Map<String, dynamic> json) {
    var favoritesJson = json['favorites'] as List;
    List<FavoriteItem> favoritesList = favoritesJson
        .map((item) => FavoriteItem.fromJson(item))
        .toList();

    return FavoriteResponseModel(favorites: favoritesList);
  }

  Map<String, dynamic> toJson() {
    return {
      'favorites': favorites.map((item) => item.toJson()).toList(),
    };
  }
}
class FavoriteItem {
  int id;
  bool isFavorite;
  String createdAt;
  int food;
  int user;

  FavoriteItem({
    required this.id,
    required this.isFavorite,
    required this.createdAt,
    required this.food,
    required this.user,
  });

  factory FavoriteItem.fromJson(Map<String, dynamic> json) {
    return FavoriteItem(
      id: json['id'],
      isFavorite: json['is_favorite'],
      createdAt: json['created_at'],
      food: json['food'],
      user: json['user'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'is_favorite': isFavorite,
      'created_at': createdAt,
      'food': food,
      'user': user,
    };
  }
}
