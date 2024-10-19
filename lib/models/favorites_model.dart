
class FavoritesModel {
  final bool isFavorite;


  FavoritesModel({
    required this.isFavorite,
  });

  factory FavoritesModel.fromJson(Map<String, dynamic> json) {
    return FavoritesModel(
      isFavorite: json['is_favorite'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'is_favorite': isFavorite,
    };
  }
}
