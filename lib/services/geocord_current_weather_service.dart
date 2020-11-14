import '../core/errors/exceptions.dart';
import '../core/network/network_info.dart';
import '../core/utils/result.dart';
import '../data_source/local/geocord_current_weather_local_data_source.dart';
import '../data_source/remote/geocord_current_weather_remote_data_source.dart';
import '../locator.dart';
import '../models/current_weather_model.dart';

abstract class GeoCordCurrentWeatherService {
  Future<Result<CurrentWeatherModel>> performGeoCordCurrentWeather();
}

class GeoCordCurrentWeatherServiceImpl implements GeoCordCurrentWeatherService {
  final _networkInfo = locator<NetworkInfo>();
  final _remoteData = locator<GeoCordCurrentWeatherRemoteDataSource>();
  final _localData = locator<GeoCordCurrentWeatherLocalDataSource>();
  @override
  Future<Result<CurrentWeatherModel>> performGeoCordCurrentWeather() async {
    bool isConnected = await _networkInfo.isConnected;
    if (isConnected) {
      try {
        final response = await _remoteData.fetchCurrentWeather();
        _localData.saveResponse(currentWeatherModel: response);
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
