import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getx_from_scratch/pages/audit/audit_controller.dart';
import 'package:getx_from_scratch/pages/audit/widgets/section_tile.dart';
import 'package:getx_from_scratch/theme/style_theme.dart';
import 'package:getx_from_scratch/utils/iconly/iconly_bold.dart';
import 'package:getx_from_scratch/utils/layouts.dart';
import 'package:getx_from_scratch/utils/size_config.dart';

class AuditPage extends GetView<AuditController> {
  const AuditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final size = Layouts.getSize(context);
    return Scaffold(
      body: Material(
        color: StyleTheme.primaryColor,
        elevation: 0,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: [
            Gap(getProportionateScreenHeight(50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Sumário',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: const Icon(IconlyBold.user1),
                  ),
                )
              ],
            ),
            const Gap(20),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SectionTile(
                      title: "Navigation .toNamed",
                      icon: IconlyBold.Download,
                      color: Color(0xFF026EF4),
                      onTap: () {
                        controller.goToOtherPageNamed();
                      }),
                  SectionTile(
                      title: "Navigation .to",
                      icon: IconlyBold.arrow___right,
                      color: Color(0xFF2BB33A),
                      onTap: () {
                        controller.goToOtherPage();
                      }),
                  SectionTile(
                      title: "Check Email is Valid",
                      icon: IconlyBold.Message,
                      color: Color(0xFF712544),
                      onTap: () {
                        controller.checkEmailIsValid();
                      }),
                  // SectionTile(
                  //     title: "Easy Internationalization",
                  //     icon: IconlyBold.Download,
                  //     color: Color(0xFF626EF4),
                  //     onTap: () {
                  //       controller.fastIntl();
                  //     }),
                  SectionTile(
                      title: "Check is CPF",
                      icon: IconlyBold.Document,
                      color: Color(0xFF026EF4),
                      onTap: () {
                        controller.checkIsCpf();
                      }),
                  Obx(
                    () => SectionTile(
                      title: "Change flag",
                      icon: controller.flag.value
                          ? IconlyBold.Shield_Done
                          : IconlyBold.Shield_Fail,
                      //INFO: Foi adicionado o value, pois não criei getter para
                      //essa variavel reativa
                      color: controller.flag.value
                          ? Color(0xFF026EF4)
                          : Color(0xFFFB6A4B),
                      onTap: () {
                        controller.changeFlag();
                      },
                    ),
                  ),
                  Obx(
                    () => SectionTile(
                      title: controller.titleSection.value,
                      icon: IconlyBold.Bookmark,
                      color: controller.flag.value
                          ? Color(0xFF026EF4)
                          : Color(0xFFFB6A4B),
                      onTap: () {
                        controller.changeFlag();
                      },
                    ),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
