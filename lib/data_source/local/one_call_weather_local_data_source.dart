import 'dart:convert';

import '../../core/persistence/database.dart';
import '../../locator.dart';
import '../../models/current_weather_model.dart';
import '../../models/one_call_weather_model.dart';
import '../../models/weather_description_model.dart';

const String ONE_CALL_KEY = 'one_call_key';
final List<WeatherDescriptionModel> weatherDescriptionModel = [];

abstract class OneCallWeatherLocalDataSource {
  Future<OneCallWeatherModel> getResponse();
  Future<OneCallWeatherModel> saveResponse(
      {OneCallWeatherModel oneCallWeatherModel});
  Future<bool> deleteResponse();
}

class OneCallWeatherLocalDataSourceImpl
    implements OneCallWeatherLocalDataSource {
  final _databaseHandler = locator<Database>();
  @override
  Future<bool> deleteResponse() {
    return _databaseHandler.delete(key: ONE_CALL_KEY);
  }

  @override
  Future<OneCallWeatherModel> getResponse() async {
    final data = await _databaseHandler.pull(key: ONE_CALL_KEY);
    if (data != null) {
      final value = OneCallWeatherModel.fromJson(json.decode(data));
      return Future.value(value);
    } else {
      final value = OneCallWeatherModel(
          lat: 0,
          lon: 0,
          currentWeather: CurrentWeatherModel(
              dt: DateTime(0),
              sunrise: DateTime(0),
              sunset: DateTime(0),
              temp: 0,
              feelsLike: 0,
              pressure: 0,
              humidity: 0,
              dewPoint: 0,
              uvi: 0,
              clouds: 0,
              visibility: 0,
              windSpeed: 0,
              windDeg: 0,
              weatherDescription: weatherDescriptionModel));
      return Future.value(value);
    }
  }

  @override
  Future<OneCallWeatherModel> saveResponse(
      {OneCallWeatherModel oneCallWeatherModel}) {
    final value = json.encode(oneCallWeatherModel.toJson());
    _databaseHandler.save(key: ONE_CALL_KEY, value: value);
    return Future.value(oneCallWeatherModel);
  }
}
