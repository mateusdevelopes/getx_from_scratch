import 'package:get/get.dart';
import 'package:getx_from_scratch/pages/audit/audit_controller.dart';

class AuditBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuditController());
  }
}
