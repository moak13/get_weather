import 'dart:convert';

import 'package:meta/meta.dart';

import '../../domain/entities/open_weather_one_call.dart';

class OpenWeatherOneCallModel extends OpenWeatherOneCall {
  OpenWeatherOneCallModel({
    @required double lat,
    @required double lon,
    @required String timezone,
    @required OpenWeatherCurrentModel current,
  }) : super(
          lat: lat,
          lon: lon,
          timezone: timezone,
          current: current,
        );

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lon': lon,
      'timezone': timezone,
      'current': current?.toMap(),
    };
  }

  factory OpenWeatherOneCallModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return OpenWeatherOneCallModel(
      lat: map['lat'],
      lon: map['lon'],
      timezone: map['timezone'],
      current: OpenWeatherCurrentModel.fromMap(map['current']),
    );
  }

  String toJson() => json.encode(toMap());

  factory OpenWeatherOneCallModel.fromJson(String source) =>
      OpenWeatherOneCallModel.fromMap(json.decode(source));
}

class OpenWeatherCurrentModel extends OpenWeatherCurrent {
  OpenWeatherCurrentModel({
    @required DateTime dt,
    @required DateTime sunrise,
    @required DateTime sunset,
    @required double temp,
    @required double feelsLike,
    @required double pressure,
    @required double humidity,
    @required double dewPoint,
    @required double uvi,
    @required double clouds,
    @required double visibility,
    @required double windSpeed,
    @required double windDeg,
    @required List<OpenWeatherDescriptionModel> weather,
  }) : super(
          dt: dt,
          sunrise: sunrise,
          sunset: sunset,
          temp: temp,
          feelsLike: feelsLike,
          pressure: pressure,
          humidity: humidity,
          dewPoint: dewPoint,
          uvi: uvi,
          clouds: clouds,
          visibility: visibility,
          windSpeed: windSpeed,
          windDeg: windDeg,
          weather: weather,
        );

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
      'weather': weather?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory OpenWeatherCurrentModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return OpenWeatherCurrentModel(
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
      weather: List<OpenWeatherDescriptionModel>.from(
          map['weather']?.map((x) => OpenWeatherDescriptionModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory OpenWeatherCurrentModel.fromJson(String source) =>
      OpenWeatherCurrentModel.fromMap(json.decode(source));
}

class OpenWeatherDescriptionModel extends OpenWeatherDescription {
  OpenWeatherDescriptionModel({
    @required int id,
    @required String main,
    @required String description,
  }) : super(
          id: id,
          main: main,
          description: description,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'main': main,
      'description': description,
    };
  }

  factory OpenWeatherDescriptionModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return OpenWeatherDescriptionModel(
      id: map['id'],
      main: map['main'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OpenWeatherDescriptionModel.fromJson(String source) =>
      OpenWeatherDescriptionModel.fromMap(json.decode(source));
}
