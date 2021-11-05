import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getx_from_scratch/constants/const_assets.dart';
import 'package:getx_from_scratch/pages/home/home_controller.dart';
import 'package:getx_from_scratch/theme/style_theme.dart';
import 'package:getx_from_scratch/utils/iconly/iconly_bold.dart';
import 'package:getx_from_scratch/utils/layouts.dart';
import 'package:getx_from_scratch/utils/size_config.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Olá, Mateus',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 16)),
                    // const Gap(3),
                    const Text('Bem vindo',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold))
                  ],
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: const Icon(IconlyBold.Notification),
                  ),
                )
              ],
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Stack(
                  children: [
                    Container(
                      height: 130,
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Porsche Panamera",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white)),
                          // Image.asset(ConstAssets.posheLogo),
                          Text(
                            "1º em vendas!",
                            style:
                                TextStyle(color: Colors.white.withOpacity(0.5)),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            stops: [0.3, 0.9],
                            colors: [Color(0xFF40CC98), Color(0xFF6CE892)]),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Image.asset(ConstAssets.orangeCar),
                  ],
                )),
              ],
            ),
            Obx(
              () => controller.isLoading.value
                  ? Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Column(
                      children: controller.cars.map<Widget>((item) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: StyleTheme.primaryWithOpacityColor,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: ListTile(
                                isThreeLine: true,
                                contentPadding: EdgeInsets.all(10),
                                trailing: Text(
                                  "\$ " + item.price,
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.white),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          item.model,
                                          style: TextStyle(
                                              color: Colors.white
                                                  .withOpacity(0.5)),
                                        ),
                                        const Gap(10),
                                        Text(
                                          item.fuel,
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                subtitle: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.manufacturer,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    const Gap(10),
                                    Text(
                                      item.type,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
