import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

import 'core/network/network_handler.dart';
import 'core/network/network_info.dart';
import 'core/persistence/database.dart';
import 'features/home/data/data_source/one_call_local_data_source.dart';
import 'features/home/data/data_source/one_call_remote_data_source.dart';
import 'features/home/data/repository/one_call_repository_impl.dart';
import 'features/home/domain/repository/one_call_repository.dart';
import 'features/home/domain/usecase/get_one_call.dart';

GetIt locator = GetIt.instance();

Future<void> setupLocator() async {
  final pref = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => pref);
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DataConnectionChecker());
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton<AppHttpClient>(() => AppHttpClientImpl());
  locator.registerLazySingleton<Database>(() => DatabaseImpl());
  locator.registerLazySingleton<OneCallRemoteDataSource>(
      () => OneCallRemoteDataSourceImpl());
  locator.registerLazySingleton<OneCallLocalDataSource>(
      () => OneCallLocalDataSourceImpl());
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  locator
      .registerLazySingleton<OneCallRepository>(() => OneCallRepositoryImpl());
  locator.registerLazySingleton(() => GetOneCall());
}
