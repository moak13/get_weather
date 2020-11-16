import 'package:stacked/stacked.dart';

import '../core/utils/result.dart';
import '../locator.dart';
import '../models/current_weather_model.dart';
import '../services/geocord_current_weather_service.dart';

class GeoCordCurrentWeatherViewModel extends BaseViewModel {
  CurrentWeatherModel _currentWeatherModel;
  CurrentWeatherModel get currentWeatherModel => _currentWeatherModel;

  String _err;
  String get err => _err;
  bool _hasError = false;
  bool get hasError => _hasError;
  final _oneCallWeatherService = locator<GeoCordCurrentWeatherService>();

  Future<Result<CurrentWeatherModel>> futureToRun() async {
    setBusy(true);
    final response =
        await _oneCallWeatherService.performGeoCordCurrentWeather();
    print(response.success);
    print(response.error);
    setBusy(false);
    if (response.success == null && response.error != null) {
      _hasError = true;
      _err = response.error.message;
      notifyListeners();
    } else if (response.success != null && response.error != null) {
      _hasError = true;
      _err = response.error.message;
      _currentWeatherModel = response.success;
      notifyListeners();
    } else {
      _hasError = false;
      _currentWeatherModel = response.success;
      notifyListeners();
    }
    return response;
  }
}
