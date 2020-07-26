import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/open_weather_one_call.dart';
import '../repository/one_call_repository.dart';

class GetOneCall implements UseCase<OpenWeatherOneCall, NoParams> {
  final OneCallRepository repository;
  GetOneCall({@required this.repository});
  @override
  Future<Either<Failure, OpenWeatherOneCall>> call(NoParams params) async {
    return await repository.getOneCall();
  }
}

class NoParams {}
