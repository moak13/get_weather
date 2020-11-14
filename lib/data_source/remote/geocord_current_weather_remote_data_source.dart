import '../../core/errors/exceptions.dart';
import '../../core/network/network_handler.dart';
import '../../core/utils/string_constant.dart';
import '../../core/utils/user_current_position.dart';
import '../../locator.dart';
import '../../models/current_weather_model.dart';

abstract class GeoCordCurrentWeatherRemoteDataSource {
  Future<CurrentWeatherModel> fetchCurrentWeather();
}

class GeoCordCurrentWeatherRemoteDataSourceImpl
    implements GeoCordCurrentWeatherRemoteDataSource {
  final _networkHandler = locator<AppHttpClient>();
  final _location = locator<UserCurrentPosition>();
  @override
  Future<CurrentWeatherModel> fetchCurrentWeather() async {
    final UserCurrentPosition _userLocation =
        await _location.getUserCurrentLocation();
    print('lon: ' + _userLocation.longitude.toString());
    print('lat: ' + _userLocation.latitude.toString());
    final String url = StringConstant.base_url +
        'weather?lat=${_userLocation.latitude}&lon=${_userLocation.longitude}&appid=${StringConstant.app_id}';
    final response = await _networkHandler.getOneCallWeather(url);

    if (response.statusCode == 200) {
      print(response.body);
      return CurrentWeatherModel.fromJson(response.body);
    } else {
      throw ServerException.fromJson(response.body);
    }
  }
}
