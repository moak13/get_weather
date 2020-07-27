import 'package:stacked/stacked.dart';

import '../../domain/entities/open_weather_one_call.dart';
import '../../domain/usecase/get_one_call.dart';

class HomeViewModel extends BaseViewModel {
  GetOneCall _getOneCall;

  bool _hasError = false;
  bool get hasError => _hasError;
  String _error;
  String get err => _error;
  String _text = 'Home View';
  String get text => _text;
  OpenWeatherOneCall _data;
  OpenWeatherOneCall get data => _data;

  Future<void> getUserWeather() async {
    setBusy(true);
    notifyListeners();
    final result = await _getOneCall(NoParams());
    result.fold((error) {
      _hasError = true;
      _error = error.toString();
      setBusy(false);
      notifyListeners();
    }, (weather) {
      _data = weather;
      setBusy(false);
      notifyListeners();
    });
  }
}
