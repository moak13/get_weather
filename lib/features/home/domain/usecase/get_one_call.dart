import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../locator.dart';
import '../entities/open_weather_one_call.dart';
import '../repository/one_call_repository.dart';

class GetOneCall implements UseCase<OpenWeatherOneCall, NoParams> {
  final OneCallRepository repository = locator<OneCallRepository>();
  @override
  Future<Either<Failure, OpenWeatherOneCall>> call(NoParams params) async {
    return await repository.getOneCall();
  }
}

class NoParams {}
