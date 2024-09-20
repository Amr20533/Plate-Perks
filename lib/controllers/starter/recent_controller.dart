import 'package:get/get.dart';
import 'package:plate_perks/models/restaurant_model.dart';
import 'package:plate_perks/repositories/recent_repository.dart';
import 'package:plate_perks/repositories/restaurant_repository.dart';

class RecentController extends GetxController{
  final RecentRepo recentRepo;

  RecentController({required this.recentRepo});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  List<dynamic> _recent = [];
  List<dynamic> get recent => _recent;

  Future<void> getAllRestaurantData()async{
    try{
      Response response = await recentRepo.getRecentData();
      if(response.statusCode == 200){
        print("*************** Got Recent Data ****************");
        _recent = [];
        _recent.addAll(RestaurantModel.fromJson(response.body).data);
        _isLoaded=true;
        update();
      }else{
        print('//////////// OOOps *_* O_O  No Recent Data ////////////////');
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