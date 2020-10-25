import '../core/errors/exceptions.dart';
import '../core/network/network_info.dart';
import '../core/utils/result.dart';
import '../data_source/local/one_call_weather_local_data_source.dart';
import '../data_source/remote/one_call_weather_remote_data_source.dart';
import '../locator.dart';
import '../models/one_call_weather_model.dart';

abstract class OneCallWeatherService {
  Future<Result<OneCallWeatherModel>> performOneCallWeather();
}

class OneCallWeatherServiceImpl implements OneCallWeatherService {
  final _networkInfo = locator<NetworkInfo>();
  final _remoteData = locator<OneCallWeatherRemoteDataSource>();
  final _localData = locator<OneCallWeatherLocalDataSource>();
  @override
  Future<Result<OneCallWeatherModel>> performOneCallWeather() async {
    bool isConnected = await _networkInfo.isConnected;
    if (isConnected) {
      try {
        final response = await _remoteData.fetchOneCallWeather();
        _localData.saveResponse(oneCallWeatherModel: response);
        return Result(success: response);
      } on ServerException catch (err) {
        return Result(error: Error(message: err.message));
      }
    } else {
      try {
        final response = await _localData.getResponse();
        return Result(
            success: response, error: Error(message: 'No Internet Connection'));
      } on CacheException catch (e) {
        return Result(error: Error(message: e.toString()));
      }
    }
  }
}
