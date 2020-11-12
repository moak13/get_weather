import 'package:stacked/stacked.dart';

import '../core/utils/result.dart';
import '../locator.dart';
import '../models/one_call_weather_model.dart';
import '../services/one_call_weather_service.dart';

class OneCallWeatherViewModel
    extends FutureViewModel<Result<OneCallWeatherModel>> {
  final _oneCallWeatherService = locator<OneCallWeatherService>();

  @override
  Future<Result<OneCallWeatherModel>> futureToRun() async {
    return await _oneCallWeatherService.performOneCallWeather();
  }
}
