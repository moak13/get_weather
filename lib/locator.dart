import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

import 'core/network/network_handler.dart';
import 'core/persistence/database.dart';

GetIt locator = GetIt.instance();

Future<void> setupLocator() async {
  final pref = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => pref);
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DataConnectionChecker());
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton<AppHttpClient>(() => AppHttpClientImpl());
  locator.registerLazySingleton<Database>(() => DatabaseImpl());
}
