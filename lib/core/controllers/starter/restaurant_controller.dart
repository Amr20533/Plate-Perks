import 'package:get/get.dart';
import 'package:plate_perks/models/restaurant_model.dart';
import 'package:plate_perks/core/repositories/restaurant_repository.dart';

class RestaurantController extends GetxController{
  final RestaurantRepo restaurantRepo;

  RestaurantController({required this.restaurantRepo});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  List<dynamic> _restaurant = [];
  List<dynamic> get restaurant => _restaurant;

  Future<void> getAllRestaurantData()async{
    try{
      Response response = await restaurantRepo.getRestaurantData();
      if(response.statusCode == 200){
        print("*************** Got Restaurant Data ****************");
        _restaurant = [];
        _restaurant.addAll(RestaurantModel.fromJson(response.body).data);
        _isLoaded=true;
        update();
      }else{
        print('//////////// OOOps *_* O_O  No Restaurants ////////////////');
      }
    }catch (e) {
      // Handle any exceptions that occur during the request
      print('Error occurred: $e');
    }
  }



  @override
  void onInit() {
    getAllRestaurantData();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}