import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/open_weather_one_call.dart';
import '../../domain/repository/one_call_repository.dart';
import '../data_source/one_call_local_data_source.dart';
import '../data_source/one_call_remote_data_source.dart';

class OneCallRepositoryImpl implements OneCallRepository {
  final OneCallRemoteDataSource remoteDataSource;
  final OneCallLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  OneCallRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });
  @override
  Future<Either<Failure, OpenWeatherOneCall>> getOneCall() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.getOneCall();
        localDataSource.cacheData(remoteData);
        return Right(remoteData);
      } on ServerException catch (e) {
        return Left(
          ServerError(
            message: e.toString(),
          ),
        );
      }
    } else {
      try {
        final cacheData = await localDataSource.getCachedData();
        return Right(cacheData);
      } on CacheException catch (e) {
        return Left(
          CacheError(
            message: e.toString(),
          ),
        );
      }
    }
  }

  @override
  List<Object> get props => [];

  @override
  bool get stringify => throw UnimplementedError();
}
