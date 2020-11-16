import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../view_models/geocord_current_weather_view_model.dart';
import '../widget/readings_widget.dart';

class GeoCordCurrentWeatherView extends StatelessWidget {
  const GeoCordCurrentWeatherView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double textScale = MediaQuery.of(context).textScaleFactor;
    double scaleHeight = screenHeight / 100;
    double scaleWidth = screenWidth / 100;
    return ViewModelBuilder<GeoCordCurrentWeatherViewModel>.reactive(
      onModelReady: (model) => model.futureToRun(),
      builder: (context, model, child) => Scaffold(
        body: model.isBusy
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Fetching Weather Data...',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: textScale * 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: scaleHeight * 12),
                    CircularProgressIndicator()
                  ],
                ),
              )
            : !model.hasError
                ? RefreshIndicator(
                    onRefresh: () => model.futureToRun(),
                    child: ListView(
                      children: <Widget>[
                        SizedBox(
                          height: scaleHeight * 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                model.currentWeatherModel.name ??
                                    'No Time Zone',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: textScale * 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.language,
                          size: scaleHeight * 30,
                        ),
                        SizedBox(
                          height: scaleHeight * 3,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              model.currentWeatherModel.main.temp
                                      .toStringAsFixed(0)
                                      .toString() +
                                  '°C',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: textScale * 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              model.currentWeatherModel.weather[0].description,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: textScale * 20,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: scaleHeight * 27,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            ReadingsWidget(
                              textSize: textScale,
                              scaleHeight: scaleHeight,
                              title: 'Humidity',
                              value:
                                  '${model.currentWeatherModel.main.humidity} %',
                            ),
                            ReadingsWidget(
                              textSize: textScale,
                              scaleHeight: scaleHeight,
                              title: 'Wind',
                              value:
                                  '${model.currentWeatherModel.wind.speed} m/s',
                            ),
                            ReadingsWidget(
                              textSize: textScale,
                              scaleHeight: scaleHeight,
                              title: 'Pressure',
                              value:
                                  '${model.currentWeatherModel.main.pressure} hPa',
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          model.err,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: textScale * 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: scaleHeight * 12),
                        InkWell(
                          onTap: () {
                            model.futureToRun();
                          },
                          child: Container(
                            height: scaleHeight * 7,
                            width: scaleWidth * 25,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Refresh',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
      ),
      viewModelBuilder: () => GeoCordCurrentWeatherViewModel(),
    );
  }
}
