import 'dart:convert';

import 'package:equatable/equatable.dart';

class WindWeatherModel extends Equatable {
  final double speed;
  WindWeatherModel({
    this.speed,
  });
  @override
  List<Object> get props => [speed];

  Map<String, dynamic> toMap() {
    return {
      'speed': speed,
    };
  }

  factory WindWeatherModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return WindWeatherModel(
      speed: map['speed'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WindWeatherModel.fromJson(String source) =>
      WindWeatherModel.fromMap(json.decode(source));
}
