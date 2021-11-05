import 'package:get/get.dart';
import 'package:getx_from_scratch/pages/home/home_controller.dart';
import 'package:getx_from_scratch/repositories/car_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICarsRepository>(() => CarRepository());
    Get.put(HomeController(Get.find()));
  }
}
