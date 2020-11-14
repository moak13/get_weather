import 'dart:convert';

import '../../core/persistence/database.dart';
import '../../locator.dart';
import '../../models/current_weather_model.dart';
import '../../models/main_weather_model.dart';
import '../../models/weather_description_model.dart';
import '../../models/wind_weather_model.dart';

const String ONE_CALL_KEY = 'one_call_key';
final List<WeatherDescriptionModel> weatherDescription = [];

abstract class GeoCordCurrentWeatherLocalDataSource {
  Future<CurrentWeatherModel> getResponse();
  Future<CurrentWeatherModel> saveResponse(
      {CurrentWeatherModel currentWeatherModel});
  Future<bool> deleteResponse();
}

class GeoCordCurrentWeatherLocalDataSourceImpl
    implements GeoCordCurrentWeatherLocalDataSource {
  final _databaseHandler = locator<Database>();
  @override
  Future<bool> deleteResponse() {
    return _databaseHandler.delete(key: ONE_CALL_KEY);
  }

  @override
  Future<CurrentWeatherModel> getResponse() async {
    final data = await _databaseHandler.pull(key: ONE_CALL_KEY);
    if (data != null) {
      final value = CurrentWeatherModel.fromJson(json.decode(data));
      return Future.value(value);
    } else {
      final value = CurrentWeatherModel(
        weather: weatherDescription,
        main: MainWeatherModel(
          temp: 0,
          pressure: 0,
          humidity: 0,
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
    _databaseHandler.save(key: ONE_CALL_KEY, value: value);
    return Future.value(currentWeatherModel);
  }
}
