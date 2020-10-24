import '../../core/errors/exceptions.dart';
import '../../core/network/network_handler.dart';
import '../../core/utils/string_constant.dart';
import '../../locator.dart';
import '../../models/one_call_weather_model.dart';

abstract class OneCallWeatherRemoteDataSource {
  Future<OneCallWeatherModel> fetchOneCallWeather({double lon, double lat});
}

class OneCallWeatherRemoteDataSourceImpl
    implements OneCallWeatherRemoteDataSource {
  final _networkHandler = locator<AppHttpClient>();
  @override
  Future<OneCallWeatherModel> fetchOneCallWeather(
      {double lon, double lat}) async {
    final String url = StringConstant.base_url +
        'onecall?lat=$lat&lon=$lon&exclude=hourly,daily&appid=${StringConstant.app_id}';
    final response = await _networkHandler.getOneCallWeather(url);

    if (response.statusCode == 200) {
      return OneCallWeatherModel.fromJson(response.body);
    } else {
      throw ServerException.fromJson(response.body);
    }
  }
}
