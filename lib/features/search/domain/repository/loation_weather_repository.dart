import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failures.dart';
import '../entities/open_weather_location.dart';

abstract class LocationWeatherRepository extends Equatable {
  Future<Either<Failure, OpenWeatherLocation>> getLocationWeather(
      {@required String cityName});
}
