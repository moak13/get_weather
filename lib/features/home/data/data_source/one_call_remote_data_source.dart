import 'dart:convert';

import 'package:meta/meta.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/network_handler.dart';
import '../model/open_weather_one_call_model.dart';

abstract class OneCallRemoteDataSource {
  /// Calls the https://api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}&exclude={part}&appid={YOUR API KEY} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<OpenWeatherOneCallModel> getOneCall();
}

class OneCallRemoteDataSourceImpl implements OneCallRemoteDataSource {
  final AppHttpClient client;

  OneCallRemoteDataSourceImpl({@required this.client});
  @override
  Future<OpenWeatherOneCallModel> getOneCall() async {
    final String url = "https://api.openweathermap.org/data/2.5/onecall";
    final Map body = {
      'lat': '',
      'lon': '',
      'exclude': 'hourly, daily',
      'appid': '',
    };
    final Map headers = {
      'content-type': 'application/json',
    };
    final response = await client.getOne(url, body: body, headers: headers);
    if (response.statusCode == 200) {
      return OpenWeatherOneCallModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
