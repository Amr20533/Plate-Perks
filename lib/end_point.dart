class AppEndPoint{
  static const String server = 'http://10.0.2.2:8000';

  static const String getAllRestaurant = '/api/v1/restaurant/getAllRestaurant';
  static const String getAllFoodData = '/api/v1/getAllFoodData';
  static const String getFoodDataById = '/api/v1/getFoodDataById';

  /// >>>>>>>>>>>>>>>>>>>>>>>>> Authentication End Points <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  static const String login = '/api/v1/login';
  static const String signup = '/api/v1/register/';
  static const String getMe = '/api/v1/getMe/';
  static const String updateMe = '/api/v1/updateMe/';
  static const String deleteMe = '/api/v1/deleteMe';

  /// >>>>>>>>>>>>>>>>>>>>>>>>> Favorites End Points <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  static const String addFoodToFavorite = '/api/v1/favorites/addFavoriteFood';
  static const String getFoodFromFavorite = '/api/v1/favorites/getFavoriteFood';

  static const String userToken = 'user-token';



}