import 'dart:convert';

import '../../core/persistence/database.dart';
import '../../locator.dart';
import '../../models/current_weather_model.dart';
import '../../models/weather_description_model.dart';

const String CURRENT_WEATHER_KEY = 'current_weather_key';
final List<WeatherDescriptionModel> weatherDescriptionModel = [];

abstract class CurrentWeatherLocalDataSource {
  Future<CurrentWeatherModel> getResponse();
  Future<CurrentWeatherModel> saveResponse(
      {CurrentWeatherModel currentWeatherModel});
  Future<bool> deleteResponse();
}

class CurrentWeatherLocalDataSourceImpl
    implements CurrentWeatherLocalDataSource {
  final _databaseHandler = locator<Database>();
  @override
  Future<bool> deleteResponse() {
    return _databaseHandler.delete(key: CURRENT_WEATHER_KEY);
  }

  @override
  Future<CurrentWeatherModel> getResponse() async {
    final data = await _databaseHandler.pull(key: CURRENT_WEATHER_KEY);
    if (data != null) {
      final value = CurrentWeatherModel.fromJson(json.decode(data));
      return Future.value(value);
    } else {
      final value = CurrentWeatherModel(
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
          weatherDescription: weatherDescriptionModel);
      return Future.value(value);
    }
  }

  @override
  Future<CurrentWeatherModel> saveResponse(
      {CurrentWeatherModel currentWeatherModel}) {
    final value = json.decode(currentWeatherModel.toJson());
    _databaseHandler.save(key: CURRENT_WEATHER_KEY, value: value);
    return Future.value(value);
  }
}
