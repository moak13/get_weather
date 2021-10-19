import 'package:flutter/material.dart';

import '../../current_weather/view/current_weather_view.dart';
import '../../forecast/view/forecast_weather_view.dart';
import '../../geocord_current_weather/view/geocord_current_weather_view.dart';

class GetIndexView extends StatelessWidget {
  final int index;

  const GetIndexView({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return GeoCordCurrentWeatherView();
      case 1:
        return ForecastWeatherView();
      case 2:
        return CurrentWeatherView();
      default:
        return GeoCordCurrentWeatherView();
    }
  }
}
