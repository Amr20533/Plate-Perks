import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppServices extends GetxService{
  late GetStorage getStorage;

  Future<AppServices> init()async{
    GetStorage.init();
    getStorage = GetStorage();
    return this;
  }
}
