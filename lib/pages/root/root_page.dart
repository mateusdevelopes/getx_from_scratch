import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_from_scratch/pages/audit/audit_page.dart';
import 'package:getx_from_scratch/pages/home/home_page.dart';
import 'package:getx_from_scratch/pages/root/root_controller.dart';
import 'package:getx_from_scratch/theme/style_theme.dart';
import 'package:getx_from_scratch/utils/iconly/iconly_bold.dart';

class RootPage extends GetView<RootController> {
  final List<Widget> bodyContent = [
    HomePage(),
    AuditPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleTheme.primaryColor,
      body: Obx(
        () => Center(
          child: bodyContent.elementAt(controller.selectedIndex),
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: StyleTheme.primaryWithOpacityColor,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedLabelStyle:
                  TextStyle(fontSize: 20, color: StyleTheme.primaryColor),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: StyleTheme.blueColor,
              unselectedItemColor: const Color(0xFF526480),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(IconlyBold.Home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconlyBold.Graph),
                  label: 'Audit',
                ),
              ],
              currentIndex: controller.selectedIndex,
              onTap: (index) {
                controller.selectedIndex = index;
              }),
        ),
      ),
    );
  }
}
