import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'weather_description_model.dart';

class CurrentWeatherModel extends Equatable {
  final DateTime dt;
  final DateTime sunrise;
  final DateTime sunset;
  final double temp;
  final double feelsLike;
  final double pressure;
  final double humidity;
  final double dewPoint;
  final double uvi;
  final double clouds;
  final double visibility;
  final double windSpeed;
  final double windDeg;
  final List<WeatherDescriptionModel> weatherDescription;
  CurrentWeatherModel({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.weatherDescription,
  });
  @override
  List<Object> get props => [
        dt,
        sunrise,
        sunset,
        temp,
        feelsLike,
        pressure,
        humidity,
        dewPoint,
        uvi,
        clouds,
        visibility,
        windSpeed,
        windDeg,
        weatherDescription
      ];

  Map<String, dynamic> toMap() {
    return {
      'dt': dt?.millisecondsSinceEpoch,
      'sunrise': sunrise?.millisecondsSinceEpoch,
      'sunset': sunset?.millisecondsSinceEpoch,
      'temp': temp,
      'feelsLike': feelsLike,
      'pressure': pressure,
      'humidity': humidity,
      'dewPoint': dewPoint,
      'uvi': uvi,
      'clouds': clouds,
      'visibility': visibility,
      'windSpeed': windSpeed,
      'windDeg': windDeg,
      'weather': weatherDescription?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory CurrentWeatherModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CurrentWeatherModel(
      dt: DateTime.fromMillisecondsSinceEpoch(map['dt']),
      sunrise: DateTime.fromMillisecondsSinceEpoch(map['sunrise']),
      sunset: DateTime.fromMillisecondsSinceEpoch(map['sunset']),
      temp: map['temp'],
      feelsLike: map['feelsLike'],
      pressure: map['pressure'],
      humidity: map['humidity'],
      dewPoint: map['dewPoint'],
      uvi: map['uvi'],
      clouds: map['clouds'],
      visibility: map['visibility'],
      windSpeed: map['windSpeed'],
      windDeg: map['windDeg'],
      weatherDescription: List<WeatherDescriptionModel>.from(
          map['weather']?.map((x) => WeatherDescriptionModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentWeatherModel.fromJson(String source) =>
      CurrentWeatherModel.fromMap(json.decode(source));
}
