import 'package:get/get.dart';
import 'package:getx_from_scratch/pages/audit/audit_binding.dart';
import 'package:getx_from_scratch/pages/audit/audit_page.dart';
import 'package:getx_from_scratch/pages/home/home_binding.dart';
import 'package:getx_from_scratch/pages/home/home_page.dart';
import 'package:getx_from_scratch/pages/root/root_binding.dart';
import 'package:getx_from_scratch/pages/root/root_page.dart';
import 'package:getx_from_scratch/routers/app_routes.dart';

class AppPage {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRouters.ROOT,
      page: () => RootPage(),
      binding: RootBinding(),
    ),
    GetPage(
      name: AppRouters.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRouters.AUDIT,
      page: () => AuditPage(),
      binding: AuditBinding(),
    ),
  ];
}
