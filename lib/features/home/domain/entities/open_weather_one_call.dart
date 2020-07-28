import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class OpenWeatherOneCall extends Equatable {
  final double lat;
  final double lon;
  final String timezone;
  final OpenWeatherCurrent current;
  OpenWeatherOneCall({
    @required this.lat,
    @required this.lon,
    @required this.timezone,
    @required this.current,
  });
  @override
  List<Object> get props => [lat, lon, timezone, current];
}

class OpenWeatherCurrent extends Equatable {
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
  final List<OpenWeatherDescription> weather;
  OpenWeatherCurrent({
    @required this.dt,
    @required this.sunrise,
    @required this.sunset,
    @required this.temp,
    @required this.feelsLike,
    @required this.pressure,
    @required this.humidity,
    @required this.dewPoint,
    @required this.uvi,
    @required this.clouds,
    @required this.visibility,
    @required this.windSpeed,
    @required this.windDeg,
    @required this.weather,
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
        weather
      ];
}

class OpenWeatherDescription extends Equatable {
  final int id;
  final String main;
  final String description;
  OpenWeatherDescription({
    @required this.id,
    @required this.main,
    @required this.description,
  });
  @override
  List<Object> get props => [id, main, description];
}
