// import 'package:geocoding/geocoding.dart';

import '../../core/errors/exceptions.dart';
import '../../core/network/network_handler.dart';
import '../../core/utils/string_constant.dart';
import '../../core/utils/user_current_position.dart';
import '../../locator.dart';
import '../../models/one_call_weather_model.dart';

abstract class OneCallWeatherRemoteDataSource {
  Future<OneCallWeatherModel> fetchOneCallWeather();
}

class OneCallWeatherRemoteDataSourceImpl
    implements OneCallWeatherRemoteDataSource {
  final _networkHandler = locator<AppHttpClient>();
  final _location = locator<UserCurrentPosition>();
  @override
  Future<OneCallWeatherModel> fetchOneCallWeather() async {
    final UserCurrentPosition _userLocation =
        await _location.getUserCurrentLocation();
    // List<Placemark> placemarks = await placemarkFromCoordinates(
    //     _userLocation.latitude, _userLocation.longitude);
    // print(placemarks);
    print('lon: ' + _userLocation.longitude.toString());
    print('lat: ' + _userLocation.latitude.toString());
    final String url = StringConstant.base_url +
        'onecall?lat=${_userLocation.latitude}&lon=${_userLocation.longitude}&exclude=hourly,daily&appid=${StringConstant.app_id}';
    final response = await _networkHandler.getOneCallWeather(url);

    if (response.statusCode == 200) {
      print(response.body);
      return OneCallWeatherModel.fromJson(response.body);
    } else {
      throw ServerException.fromJson(response.body);
    }
  }
}
