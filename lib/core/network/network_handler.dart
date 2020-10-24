import 'package:http/http.dart' as http;

import '../../locator.dart';

abstract class AppHttpClient {
  Future<http.Response> getOneCallWeather(String url,
      {Map<String, String> body, Map<String, String> headers});
  Future<http.Response> getCurrentWeather(String url,
      {Map<String, String> body, Map<String, String> headers});
}

class AppHttpClientImpl implements AppHttpClient {
  final http.Client client = locator<http.Client>();
  @override
  Future<http.Response> getOneCallWeather(String url,
      {Map<String, String> body, Map<String, String> headers}) async {
    final response = await client.post(url, body: body, headers: headers);
    return response;
  }

  @override
  Future<http.Response> getCurrentWeather(String url,
      {Map<String, String> body, Map<String, String> headers}) async {
    final response = await client.post(url, body: body, headers: headers);
    return response;
  }
}
