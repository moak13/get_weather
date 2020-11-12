import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../view_models/one_call_weather_view_model.dart';

class OneCallWeatherView extends StatelessWidget {
  const OneCallWeatherView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double textScale = MediaQuery.of(context).textScaleFactor;
    double scaleHeight = screenHeight / 100;
    double scaleWidth = screenWidth / 100;
    return ViewModelBuilder<OneCallWeatherViewModel>.reactive(
      onModelReady: (model) => model.futureToRun(),
      builder: (context, model, child) => Scaffold(
        body: ListView(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[Text('26'), Text('partly cloudly')],
            ),
            Expanded(
              child: SizedBox(
                height: scaleHeight * 400,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Humidity'),
                        Text('88%'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Precipitation'),
                        Text('80%'),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Wind'),
                        Text('10km/h'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Pressure'),
                        Text('10122mb'),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      viewModelBuilder: () => OneCallWeatherViewModel(),
    );
  }
}
