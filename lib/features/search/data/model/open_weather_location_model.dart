import 'package:meta/meta.dart';
import 'package:get_weather/features/search/domain/entities/open_weather_location.dart';

class OpenWeatherLocationModel extends OpenWeatherLocation {
  OpenWeatherLocationModel({
    @required List<OpenWeatherCurrentWeather> weather,
    @required OpenWeatherMain main,
    @required OpenWeatherWind wind,
    @required String name,
  }) : super(weather: weather, main: main, wind: wind, name: name);
}

class OpenWeatherCurrentWeatherModel extends OpenWeatherCurrentWeather {
  OpenWeatherCurrentWeatherModel({
    @required int id,
    @required String main,
    @required String description,
  }) : super(
          id: id,
          main: main,
          description: description,
        );

  factory OpenWeatherCurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return OpenWeatherCurrentWeatherModel(
      id: json['id'],
      main: json['main'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'main': main,
      'description': description,
    };
  }
}

class OpenWeatherMainModel extends OpenWeatherMain {
  OpenWeatherMainModel({
    @required double temp,
    @required double feelsLike,
    @required double tempMin,
    @required double tempMax,
    @required int pressure,
    @required int humidity,
  }) : super(
          temp: temp,
          feelsLike: feelsLike,
          tempMin: tempMin,
          tempMax: tempMax,
          pressure: pressure,
          humidity: humidity,
        );

  factory OpenWeatherMainModel.fromJson(Map<String, dynamic> json) {
    return OpenWeatherMainModel(
      temp: json['temp'],
      feelsLike: json['feels_like'],
      tempMin: json['temp_min'],
      tempMax: json['temp_max'],
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temp': temp,
      'feels_like': feelsLike,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'pressure': pressure,
      'humidity': humidity,
    };
  }
}

class OpenWeatherWindModel extends OpenWeatherWind {
  OpenWeatherWindModel({
    @required double speed,
    @required int deg,
  }) : super(
          speed: speed,
          deg: deg,
        );

  factory OpenWeatherWindModel.fromJson(Map<String, dynamic> json) {
    return OpenWeatherWindModel(
      speed: json['speed'],
      deg: json['deg'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'speed': speed,
      'deg': deg,
    };
  }
}
