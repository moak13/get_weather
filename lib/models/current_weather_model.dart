import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'main_weather_model.dart';
import 'weather_description_model.dart';
import 'wind_weather_model.dart';

class CurrentWeatherModel extends Equatable {
  final List<WeatherDescriptionModel> weather;
  final MainWeatherModel main;
  final WindWeatherModel wind;
  final int id;
  final String name;
  CurrentWeatherModel({
    this.weather,
    this.main,
    this.wind,
    this.id,
    this.name,
  });

  @override
  List<Object> get props => [weather, main, wind, id, name];

  Map<String, dynamic> toMap() {
    return {
      'weather': weather?.map((x) => x?.toMap())?.toList(),
      'main': main?.toMap(),
      'wind': wind?.toMap(),
      'id': id,
      'name': name,
    };
  }

  factory CurrentWeatherModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CurrentWeatherModel(
      weather: List<WeatherDescriptionModel>.from(
          map['weather']?.map((x) => WeatherDescriptionModel.fromMap(x))),
      main: MainWeatherModel.fromMap(map['main']),
      wind: WindWeatherModel.fromMap(map['wind']),
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentWeatherModel.fromJson(String source) =>
      CurrentWeatherModel.fromMap(json.decode(source));
}
