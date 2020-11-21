import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:get_weather/core/network/network_info.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

import 'core/network/network_handler.dart';
import 'core/persistence/database.dart';
import 'core/utils/user_current_position.dart';
import 'data_source/local/current_weather_local_data_source.dart';
import 'data_source/local/geocord_current_weather_local_data_source.dart';
import 'data_source/remote/current_weather_remote_data_source.dart';
import 'data_source/remote/geocord_current_weather_remote_data_source.dart';
import 'services/current_weather_service.dart';
import 'services/geocord_current_weather_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  final pref = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => pref);
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => DataConnectionChecker());
  locator.registerLazySingleton(() => UserCurrentPosition());
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  locator.registerLazySingleton<AppHttpClient>(() => AppHttpClientImpl());
  locator.registerLazySingleton<Database>(() => DatabaseImpl());
  locator.registerLazySingleton<GeoCordCurrentWeatherLocalDataSource>(
      () => GeoCordCurrentWeatherLocalDataSourceImpl());
  locator.registerLazySingleton<CurrentWeatherLocalDataSource>(
      () => CurrentWeatherLocalDataSourceImpl());
  locator.registerLazySingleton<GeoCordCurrentWeatherRemoteDataSource>(
      () => GeoCordCurrentWeatherRemoteDataSourceImpl());
  locator.registerLazySingleton<CurrentWeatherRemoteDataSource>(
      () => CurrentWeatherRemoteDataSourceImpl());
  locator.registerLazySingleton<GeoCordCurrentWeatherService>(
      () => GeoCordCurrentWeatherServiceImpl());
  locator.registerLazySingleton<CurrentWeatherService>(
      () => CurrentWeatherServiceImpl());
}
