import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/open_weather_location.dart';
import '../repository/loation_weather_repository.dart';

class GetLocationWeather implements UseCase<OpenWeatherLocation, Params> {
  final LocationWeatherRepository repository;
  GetLocationWeather({
    @required this.repository,
  });
  @override
  Future<Either<Failure, OpenWeatherLocation>> call(Params params) async {
    return await repository.getLocationWeather(cityNmae: params.cityName);
  }
}

class Params extends Equatable {
  final String cityName;
  Params({
    @required this.cityName,
  });
  @override
  List<Object> get props => [cityName];
}
