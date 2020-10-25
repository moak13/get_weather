import '../core/errors/exceptions.dart';
import '../core/network/network_info.dart';
import '../core/utils/result.dart';
import '../data_source/local/current_weather_local_data_source.dart';
import '../data_source/remote/current_weather_remote_data_source.dart';
import '../locator.dart';
import '../models/current_weather_model.dart';

abstract class CurrentWeatherService {
  Future<Result<CurrentWeatherModel>> performCurrentWeather({String cityName});
}

class CurrentWeatherServiceImpl implements CurrentWeatherService {
  final _remoteData = locator<CurrentWeatherRemoteDataSource>();
  final _localData = locator<CurrentWeatherLocalDataSource>();
  final _networkInfo = locator<NetworkInfo>();
  @override
  Future<Result<CurrentWeatherModel>> performCurrentWeather(
      {String cityName}) async {
    bool isConnected = await _networkInfo.isConnected;
    if (isConnected) {
      try {
        final response =
            await _remoteData.fetchCurrentWeather(cityName: cityName);
        _localData.saveResponse(currentWeatherModel: response);
        return Result(success: response);
      } on ServerException catch (e) {
        return Result(error: Error(message: e.message));
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
