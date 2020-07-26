import 'package:get_weather/features/home/domain/entities/open_weather_one_call.dart';
import 'package:meta/meta.dart';

class OpenWeatherOneCallModel extends OpenWeatherOneCall {
  OpenWeatherOneCallModel({
    @required double lat,
    @required double lon,
    @required String timezone,
    @required OpenWeatherCurrent current,
  }) : super(
          lat: lat,
          lon: lon,
          timezone: timezone,
          current: current,
        );

  factory OpenWeatherOneCallModel.fromJson(Map<String, dynamic> json) {
    return OpenWeatherOneCallModel(
      lat: json['lat'],
      lon: json['lon'],
      timezone: json['timezone'],
      current: json['current'] == null
          ? null
          : OpenWeatherCurrentModel.fromJson(json['current']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lon': lon,
      'timezone': timezone,
      'current': current,
    };
  }
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
    @required OpenWeatherDescription weather,
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

  factory OpenWeatherCurrentModel.fromJson(Map<String, dynamic> json) {
    return OpenWeatherCurrentModel(
      dt: json['dt'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      temp: json['temp'],
      feelsLike: json['feels_like'],
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: json['dew_point'],
      uvi: json['uvi'],
      clouds: json['clouds'],
      visibility: json['visibility'],
      windSpeed: json['wind_speed'],
      windDeg: json['wind_deg'],
      weather: json['weather'] == null
          ? null
          : OpenWeatherDescriptionModel.fromJson(json['weather']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dt': dt,
      'sunrise': sunrise,
      'sunset': sunset,
      'temp': temp,
      'feels_like': feelsLike,
      'pressure': pressure,
      'humidity': humidity,
      'dew_point': dewPoint,
      'uvi': uvi,
      'clouds': clouds,
      'visibility': visibility,
      'wind_speed': windSpeed,
      'wind_deg': windDeg,
      'weather': weather,
    };
  }
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

  factory OpenWeatherDescriptionModel.fromJson(Map<String, dynamic> json) {
    return OpenWeatherDescriptionModel(
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
