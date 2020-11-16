import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../core/utils/result.dart';
import '../locator.dart';
import '../models/current_weather_model.dart';
import '../services/current_weather_service.dart';

class CurrentWeatherViewModel extends BaseViewModel {
  final _currentWeatherService = locator<CurrentWeatherService>();
  TextEditingController _ctrlCityName = TextEditingController();
  TextEditingController get ctrlCityName => _ctrlCityName;

  CurrentWeatherModel _currentWeatherModel;
  CurrentWeatherModel get currentWeatherModel => _currentWeatherModel;

  bool _hasError = false;
  bool get hasError => _hasError;

  String _err;
  String get err => _err;

  Future<Result<CurrentWeatherModel>> futureToRun(String cityName) async {
    setBusy(true);
    final response = await _currentWeatherService.performCurrentWeatherByName(
        cityName: cityName);
    print(response.success);
    print(response.error);
    setBusy(false);
    if (response.success == null) {
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
