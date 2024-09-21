import 'package:get/get.dart';
import 'package:plate_perks/models/food_model.dart';
import 'package:plate_perks/repositories/food_repositories.dart';

class FoodController extends GetxController{
  final FoodRepo foodRepo;

  FoodController({required this.foodRepo});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  List<dynamic> _food = [];
  List<dynamic> get food => _food;

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