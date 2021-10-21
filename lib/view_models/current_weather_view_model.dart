import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../core/utils/result.dart';
import '../features/current_weather/widget/result_modal_view.dart';
import '../locator.dart';
import '../models/current_weather_model.dart';
import '../services/current_weather_service.dart';

class CurrentWeatherViewModel extends BaseViewModel {
  final _currentWeatherService = locator<CurrentWeatherService>();

  final _navigationService = locator<NavigationService>();
  TextEditingController _ctrlCityName = TextEditingController();
  TextEditingController get ctrlCityName => _ctrlCityName;

  Future<Result<CurrentWeatherModel>> futureToRun(
    BuildContext context,
    String cityName,
    double scaledHeight,
    double scaledWidth,
    double textSize,
  ) async {
    setBusy(true);
    final response = await _currentWeatherService.performCurrentWeatherByName(
        cityName: cityName);
    print(response.success);
    print(response.error);
    setBusy(false);
    if (response.success == null) {
      await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Error!'),
            content: Text(response.error.message),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  _navigationService.back();
                },
                child: Text('cancel'),
              ),
            ],
          ));
      notifyListeners();
    } else if (response.success != null && response.error != null) {
      await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Error!'),
            content: Text(response.error.message),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  _navigationService.back();
                },
                child: Text('cancel'),
              ),
            ],
          ));
      notifyListeners();
    } else {
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => Dialog(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: ResultModalView(
            scaledHeight: scaledHeight,
            scaledWidth: scaledWidth,
            textSize: textSize,
            currentWeatherModel: response.success,
            onPress: () {
              _navigationService.back();
            },
          ),
        ),
      );
      notifyListeners();
    }
    notifyListeners();
    return response;
  }
}
