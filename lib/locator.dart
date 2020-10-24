import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

import 'core/network/network_handler.dart';
import 'core/persistence/database.dart';
import 'data_source/local/current_weather_local_data_source.dart';
import 'data_source/local/one_call_weather_local_data_source.dart';
import 'data_source/remote/one_call_weather_remote_data_source.dart';

GetIt locator = GetIt.instance();

Future<void> setupLocator() async {
  final pref = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => pref);
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DataConnectionChecker());
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton<AppHttpClient>(() => AppHttpClientImpl());
  locator.registerLazySingleton<Database>(() => DatabaseImpl());
  locator.registerLazySingleton<OneCallWeatherLocalDataSource>(
      () => OneCallWeatherLocalDataSourceImpl());
  locator.registerLazySingleton<CurrentWeatherLocalDataSource>(
      () => CurrentWeatherLocalDataSourceImpl());
  locator.registerLazySingleton<OneCallWeatherRemoteDataSource>(
      () => OneCallWeatherRemoteDataSourceImpl());
}
