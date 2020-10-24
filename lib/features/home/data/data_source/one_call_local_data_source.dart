import 'dart:convert';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/persistence/database.dart';
import '../../../../locator.dart';
import '../model/open_weather_one_call_model.dart';

const String key = 'home';

abstract class OneCallLocalDataSource {
  /// Gets the cached [OpenWeatherOneCallModel] which was gotten the last time
  /// the user had internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<OpenWeatherOneCallModel> getCachedData();

  /// Saves the data [OpenWeatherOneCallModel] which is gotten as
  /// the user has internet connection.
  ///
  /// We assume it throws [CacheException] if data can't be stored.
  Future<void> cacheData(OpenWeatherOneCallModel cacheData);
}

class OneCallLocalDataSourceImpl implements OneCallLocalDataSource {
  Database database = locator<Database>();
  @override
  Future<void> cacheData(OpenWeatherOneCallModel cacheData) {
    return database.save(
      key: key,
      value: json.encode(cacheData.toJson()),
    );
  }

  @override
  Future<OpenWeatherOneCallModel> getCachedData() async {
    final jsonString = await database.pull(key: key);
    if (jsonString != null) {
      return Future.value(
        OpenWeatherOneCallModel.fromJson(
          json.decode(jsonString),
        ),
      );
    } else {
      throw CacheException();
    }
  }
}
