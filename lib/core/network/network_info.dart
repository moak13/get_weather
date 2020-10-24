import 'package:data_connection_checker/data_connection_checker.dart';

import '../../locator.dart';

// This class holds the return value of internet connection in boolean
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

// This implementation tends to check of the user device is online or not
class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker =
      locator<DataConnectionChecker>();
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
