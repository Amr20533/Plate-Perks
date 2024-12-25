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

  /// >>>>>>>>>>>>>>>>>>>>>>>>> Reviews End Points <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  static const String addFoodReview = '/api/v1/reviews/addFoodReview';
  static const String getFoodReviews = '/api/v1/reviews/getFoodReviews';

 /// >>>>>>>>>>>>>>>>>>>>>>>>> Reviews End Points <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  static const String addFoodToCart = '/api/v1/cart/userAddToCart';
  static const String deleteFoodFromCart = '/api/v1/cart/userRemoveFromCart';
  static const String getFoodInCart = '/api/v1/cart/userGetAllCart';
 /// >>>>>>>>>>>>>>>>>>>>>>>>> Order End Points <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  static const String makeFoodOrder = '/api/v1/order/createOrder';
  static const String getFoodOrders = '/api/v1/order/getAllOrders';
  static const String foodCheckout = '/api/v1/order/checkout';

  static const String userToken = 'user-token';
  static const String language = 'app-lang';



}