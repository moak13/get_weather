import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../entities/open_weather_one_call.dart';

abstract class OneCallRepository extends Equatable {
  Future<Either<Failure, OpenWeatherOneCall>> getOneCall();
}
