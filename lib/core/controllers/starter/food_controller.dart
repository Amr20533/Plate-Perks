import 'package:get/get.dart';
import 'package:plate_perks/models/food_model.dart';
import 'package:plate_perks/core/repositories/food_repositories.dart';
import 'package:plate_perks/utils/states/data_status.dart';

class FoodController extends GetxController{
  final FoodRepo foodRepo;

  FoodController({required this.foodRepo});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  List<dynamic> _food = [];
  List<dynamic> get food => _food;

  List<dynamic> _foodInCart = [];
  List<dynamic> get foodInCart => _foodInCart;
  DataStatus dataStatus = DataStatus.loading;

  Future<void> getAllFoodData()async{
    try{
      Response response = await foodRepo.getFoodData();
      if(response.statusCode == 200){
        print("*************** Got Food Data ****************");
        _food = [];
        _food.addAll(FoodModel.fromJson(response.body).data);
        _isLoaded=true;
        update();
      }else{
        print('//////////// OOOps *_* O_O  No Food Data ////////////////');
      }
    }catch (e) {
      // Handle any exceptions that occur during the request
      print('Error occurred: $e');
    }
  }

  Future<void> getFoodById(int id)async{
    dataStatus = DataStatus.loading;
    try{
      Response response = await foodRepo.getFoodById(id);
      if(response.statusCode == 200){
        print("*************** Got Food Data ****************");
        _foodInCart = [];
        _foodInCart.addAll(FoodModel.fromJson(response.body).data);
        dataStatus = DataStatus.success;

      }else{
        print('//////////// OOOps *_* O_O  No Food Data ////////////////');
        dataStatus = DataStatus.failed;
      }
    }catch (e) {
      dataStatus = DataStatus.error;
      // Handle any exceptions that occur during the request
      print('Error occurred: $e');
    }
  }



  @override
  void onInit() {
    getAllFoodData();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}