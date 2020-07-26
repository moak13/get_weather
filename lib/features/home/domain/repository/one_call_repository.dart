import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

abstract class OneCallRepository extends Equatable {
  Future<Either<Failure, OpenWeatherOneCall>> getOneCall();
}