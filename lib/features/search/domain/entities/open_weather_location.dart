import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class OpenWeatherLocation extends Equatable {
  final List<OpenWeatherCurrentWeather> weather;
  final OpenWeatherMain main;
  final OpenWeatherWind wind;
  final String name;
  OpenWeatherLocation({
    @required this.weather,
    @required this.main,
    @required this.wind,
    @required this.name,
  });

  @override
  List<Object> get props => [weather, main, wind, name];
}

class OpenWeatherCurrentWeather extends Equatable {
  final int id;
  final String main;
  final String description;

  OpenWeatherCurrentWeather({
    @required this.id,
    @required this.main,
    @required this.description,
  });
  @override
  List<Object> get props => [id, main, description];
}

class OpenWeatherMain extends Equatable {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  OpenWeatherMain({
    @required this.temp,
    @required this.feelsLike,
    @required this.tempMin,
    @required this.tempMax,
    @required this.pressure,
    @required this.humidity,
  });
  @override
  List<Object> get props =>
      [temp, feelsLike, tempMax, tempMin, pressure, humidity];
}

class OpenWeatherWind extends Equatable {
  final double speed;
  final int deg;
  OpenWeatherWind({
    @required this.speed,
    @required this.deg,
  });
  @override
  List<Object> get props => [speed, deg];
}
