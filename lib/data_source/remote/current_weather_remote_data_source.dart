import '../../core/errors/exceptions.dart';
import '../../core/network/network_handler.dart';
import '../../core/utils/string_constant.dart';
import '../../locator.dart';
import '../../models/current_weather_model.dart';

abstract class CurrentWeatherRemoteDataSource {
  Future<CurrentWeatherModel> fetchCurrentWeatherByName({String cityName});
}

class CurrentWeatherRemoteDataSourceImpl
    implements CurrentWeatherRemoteDataSource {
  final _networkHandler = locator<AppHttpClient>();
  @override
  Future<CurrentWeatherModel> fetchCurrentWeatherByName(
      {String cityName}) async {
    final url = StringConstant.base_url +
        'weather?q=$cityName&appid=${StringConstant.app_id}';
    final response = await _networkHandler.getCurrentWeather(url);
    print(response.body);

    if (response.statusCode == 200) {
      return CurrentWeatherModel.fromJson(response.body);
    } else {
      throw ServerException.fromJson(response.body);
    }
  }
}
