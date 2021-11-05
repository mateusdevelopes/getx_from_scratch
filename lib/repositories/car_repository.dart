import 'package:dio/dio.dart';
import 'package:getx_from_scratch/models/car_model.dart';
import 'package:getx_from_scratch/services/rest_client.dart';
import 'package:getx_from_scratch/services/status_exception/errors_string.dart';
import 'package:getx_from_scratch/services/status_exception/status_exception.dart';

class ClientEndpoints {
  static const String products = "/Products";
}

abstract class ICarsRepository {
  Future<List<CarModel>> fetchCars();
  Future<CarModel> detailsOfACar();
}

class CarRepository extends ICarsRepository {
  final Dio _dio = Dio(restClient.options);

  @override
  Future<List<CarModel>> fetchCars() async {
    try {
      var response = await _dio.get(ClientEndpoints.products);
      return response.data.map<CarModel>((e) => CarModel.fromMap(e)).toList() ??
          [];
    } on DioError catch (e) {
      ErrosString treatedErrors = ErrosString.automaticMessages(
        messageToBeReplicated: "Lista de carros não encontrada",
        dioError: e,
      );
      throw StatusException().build(e.response?.statusCode ?? 0, treatedErrors);
    }
  }

  @override
  Future<CarModel> detailsOfACar() {
    // TODO: implement detailsOfACar
    throw UnimplementedError();
  }
}
