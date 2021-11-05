import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_from_scratch/pages/examples/example_page.dart';
import 'package:getx_from_scratch/routers/app_routes.dart';
import 'package:getx_from_scratch/utils/snack_bars.dart';

class AuditController extends GetxController {
  final flag = false.obs;
  final titleSection = 'Mudar o texto'.obs;

  changeFlag() {
    // mude o valor entre true/false
    flag.toggle();
    flag.isFalse
        ? titleSection.value = 'MODO MUTANTE, ATIVAR'
        : titleSection.value = 'Mudar o texto';
  }

  goToOtherPageNamed() {
    Get.toNamed(AppRouters.HOME);
  }

  goToOtherPage() {
    Get.to(ExamplePage());
  }

  checkEmailIsValid() {
    GetUtils.isEmail('mateus@teste.com')
        ? SnackBars.successSnackbar(msg: "Email valido!")
        : SnackBars.errorSnackbar(msg: "Email não valido!");
  }

  checkIsCpf() {
    GetUtils.isCpf('059.545.343.01')
        ? SnackBars.successSnackbar(msg: "CPF CORRETO!")
        : SnackBars.errorSnackbar(msg: "NÃO É CPF REAL!");
  }

  //TODO: ESTUDAR NOVA FEATURE OFERECIDA
  fastIntl() {
    String menssage = "Hello World".tr;
    var locale = Locale('pt', 'BR');
    Get.updateLocale(locale);
    SnackBars.infoSnackbar(msg: menssage);
  }

  checkPlataform() {
    !GetPlatform.isIOS
        ? SnackBars.infoSnackbar(msg: "É ios")
        : SnackBars.errorSnackbar(msg: "Outra plataforma");
  }

  justToShow() {
    Get.to(
      ExamplePage(),
      arguments: "VALOR OU OBJETO",
      transition: Transition.fade,
    );
    Get.toNamed(
      "/rotaNomeada",
      arguments: "VALOR OU OBJETO",
    );
    Get.back();
    Get.off(
      ExamplePage(),
      arguments: "VALOR OU OBJETO",
      transition: Transition.cupertino,
    );
    Get.offNamed(
      "/rotaNomeada",
      arguments: "VALOR OU OBJETO",
    );
    Get.snackbar("TITULO", "Mensagem");
    //
    Get.dialog(Container(
      child: Text("texto"),
    ));
  }
}

// fornece o context da tela em qualquer lugar do seu código.
// Get.context

// fornece os arguments da tela atual
// Get.arguments

// checa se o snackbar está aberto
// Get.isSnackbarOpen

//INFO: O GETX OFERECE NATIVAMENTE HTTP "A LÁ" GETX...
// class UserProvider extends GetConnect {
//   // Requisição Get
//   Future<Response> getUser(int id) => get('http://youapi/users/$id');
//   // Requisição Post
//   Future<Response> postUser(Map data) =>
//       post('http://youapi/users', body: data);
//   // Requisição Post com Arquivo
//   Future<Response<CasesModel>> postCases(List<int> image) {
//     final form = FormData({
//       'file': MultipartFile(image, filename: 'avatar.png'),
//       'otherFile': MultipartFile(image, filename: 'cover.png'),
//     });
//     return post('http://youapi/users/upload', form);
//   }

//   GetSocket userMessages() {
//     return socket('https://yourapi/users/socket');
//   }
// }
