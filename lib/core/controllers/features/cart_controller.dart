import 'package:get/get.dart';

class CartController extends GetxController{
  int _count = 1;
  int get count => _count;

  set count(int newCount){
    _count = newCount;
    update();
  }

  void countUp(){
    _count++;
    update();
  }
  void countDown(){
    if(_count > 1){
      _count--;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
  @override
  void dispose() {
    super.dispose();
  }

}