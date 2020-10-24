import 'dart:convert';

import 'package:equatable/equatable.dart';

class WeatherDescriptionModel extends Equatable {
  final int id;
  final String main;
  final String description;
  WeatherDescriptionModel({
    this.id,
    this.main,
    this.description,
  });
  @override
  List<Object> get props => [id, main, description];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'main': main,
      'description': description,
    };
  }

  factory WeatherDescriptionModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return WeatherDescriptionModel(
      id: map['id'],
      main: map['main'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherDescriptionModel.fromJson(String source) =>
      WeatherDescriptionModel.fromMap(json.decode(source));
}
