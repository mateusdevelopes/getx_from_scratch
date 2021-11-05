import 'package:get/get.dart';
import 'package:getx_from_scratch/pages/audit/audit_controller.dart';
import 'package:getx_from_scratch/pages/home/home_controller.dart';
import 'package:getx_from_scratch/pages/root/root_controller.dart';
import 'package:getx_from_scratch/repositories/car_repository.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICarsRepository>(() => CarRepository());
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
    Get.lazyPut<AuditController>(() => AuditController());
    Get.put(RootController());
  }
}
