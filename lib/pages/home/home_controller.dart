import 'package:get/get.dart';
import 'package:getx_from_scratch/models/car_model.dart';

import 'package:getx_from_scratch/repositories/car_repository.dart';
import 'package:getx_from_scratch/services/rest_exception.dart';
import 'package:getx_from_scratch/utils/snack_bars.dart';

class HomeController extends GetxController {
  HomeController(this._carsRepository);

  final ICarsRepository _carsRepository;

  final _cars = <CarModel>[].obs;
  final _isLoading = true.obs;

  List<CarModel> get cars => this._cars.toList();
  set cars(List<CarModel> value) => this._cars.value = value;

  get isLoading => _isLoading;

  @override
  Future<void> onInit() async {
    await _fetchlistOfCars();
    super.onInit();
  }

  Future<void> _fetchlistOfCars() async {
    _isLoading(true);
    try {
      final carsList = await _carsRepository.fetchCars();
      _cars.value = carsList;
    } on RestException catch (e) {
      SnackBars.errorSnackbar(msg: e.message);
    }
    _isLoading(false);
  }
}
