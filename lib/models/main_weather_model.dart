import 'dart:convert';

import 'package:equatable/equatable.dart';

class MainWeatherModel extends Equatable {
  final double temp;
  final int pressure;
  final int humidity;
  MainWeatherModel({
    this.temp,
    this.pressure,
    this.humidity,
  });
  @override
  List<Object> get props => [temp, pressure, humidity];

  Map<String, dynamic> toMap() {
    return {
      'temp': temp,
      'pressure': pressure,
      'humidity': humidity,
    };
  }

  factory MainWeatherModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MainWeatherModel(
      temp: map['temp'],
      pressure: map['pressure'],
      humidity: map['humidity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MainWeatherModel.fromJson(String source) =>
      MainWeatherModel.fromMap(json.decode(source));
}
