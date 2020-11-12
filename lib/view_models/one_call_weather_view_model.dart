import 'package:stacked/stacked.dart';

import '../core/utils/result.dart';
import '../locator.dart';
import '../models/one_call_weather_model.dart';
import '../services/one_call_weather_service.dart';

class OneCallWeatherViewModel extends BaseViewModel {
  OneCallWeatherModel _oneCallWeatherModel;
  OneCallWeatherModel get oneCallWeatherModel => _oneCallWeatherModel;

  String _err;
  String get err => _err;
  final _oneCallWeatherService = locator<OneCallWeatherService>();

  Future<Result<OneCallWeatherModel>> futureToRun() async {
    setBusy(true);
    final response = await _oneCallWeatherService.performOneCallWeather();
    print(response.success);
    print(response.error);
    setBusy(false);
    if (response.success == null) {
      _err = response.error.message;
      notifyListeners();
    } else {
      _oneCallWeatherModel = response.success;
      notifyListeners();
    }
    return response;
  }
}
