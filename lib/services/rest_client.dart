import 'package:dio/dio.dart';

class RestClient {
  static const BASE_URL = "https://6183cc0291d76c00172d1b7c.mockapi.io";
  static const CONTENT_TYPE = "application/json; charset=utf-8";
  static const CONNECTION_TIME_OUT = 10000;
  static const RECIVE_TIME_OUT = 1000;

  final BaseOptions options = new BaseOptions(
    baseUrl: BASE_URL,
    contentType: CONTENT_TYPE,
    connectTimeout: CONNECTION_TIME_OUT,
    receiveTimeout: RECIVE_TIME_OUT,
    headers: {
      // TODO: HABILITAR CASO NESCESSARIO
      // 'Authorization': 'Bearer ${accessToken}',
    },
  );

  static void refreshSaveToken() {
    restClient.options.headers = {
      // TODO: CORRIGIR CASO NECESSARIO
      // 'Authorization': 'Bearer ${accessToken}',
    };
  }
}

RestClient restClient = new RestClient();
