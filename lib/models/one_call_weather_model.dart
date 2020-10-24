import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'current_weather_model.dart';

class OneCallWeatherModel extends Equatable {
  final double lat;
  final double lon;
  final String timezone;
  final CurrentWeatherModel currentWeather;
  OneCallWeatherModel({
    this.lat,
    this.lon,
    this.timezone,
    this.currentWeather,
  });
  @override
  List<Object> get props => [lat, lon, timezone, currentWeather];

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lon': lon,
      'timezone': timezone,
      'current': currentWeather?.toMap(),
    };
  }

  factory OneCallWeatherModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return OneCallWeatherModel(
      lat: map['lat'],
      lon: map['lon'],
      timezone: map['timezone'],
      currentWeather: CurrentWeatherModel.fromMap(map['current']),
    );
  }

  String toJson() => json.encode(toMap());

  factory OneCallWeatherModel.fromJson(String source) =>
      OneCallWeatherModel.fromMap(json.decode(source));
}
