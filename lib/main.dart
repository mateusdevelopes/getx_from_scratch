import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_from_scratch/routers/app_pages.dart';
import 'package:getx_from_scratch/routers/app_routes.dart';
import 'package:getx_from_scratch/theme/style_theme.dart';
import 'package:getx_from_scratch/utils/messages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouters.ROOT,
      getPages: AppPage.pages,
      //u can use - Get.deviceLocale
      locale: Locale('en', 'US'),
      translations: Messages(),
      theme: ThemeData(
          fontFamily: "DMSans",
          primaryColor: StyleTheme.primaryColor,
          backgroundColor: StyleTheme.primaryColor),
    ),
  );
}
