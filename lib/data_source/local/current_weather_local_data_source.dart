import 'dart:convert';

import '../../core/persistence/database.dart';
import '../../locator.dart';
import '../../models/current_weather_model.dart';
import '../../models/main_weather_model.dart';
import '../../models/weather_description_model.dart';
import '../../models/wind_weather_model.dart';

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
        weather: weatherDescriptionModel,
        main: MainWeatherModel(
          temp: 0,
          humidity: 0,
          pressure: 0,
        ),
        wind: WindWeatherModel(
          speed: 0,
        ),
        id: 0,
        name: '',
      );
      return Future.value(value);
    }
  }

  @override
  Future<CurrentWeatherModel> saveResponse(
      {CurrentWeatherModel currentWeatherModel}) {
    final value = json.encode(currentWeatherModel.toJson());
    _databaseHandler.save(key: CURRENT_WEATHER_KEY, value: value);
    return Future.value(currentWeatherModel);
  }
}
