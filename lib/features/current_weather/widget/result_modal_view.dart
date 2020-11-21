import 'package:flutter/material.dart';

import '../../../models/current_weather_model.dart';
import 'readings_widget.dart';

class ResultModalView extends StatelessWidget {
  final double scaledHeight;
  final double scaledWidth;
  final double textSize;
  final Function onPress;
  final CurrentWeatherModel currentWeatherModel;
  const ResultModalView({
    Key key,
    this.scaledHeight,
    this.scaledWidth,
    this.textSize,
    this.onPress,
    this.currentWeatherModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: scaledHeight * 200,
        width: scaledWidth * 300,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: onPress,
                child: Container(
                  height: scaledHeight * 7,
                  width: scaledWidth * 10,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: textSize * 25,
                    ),
                  ),
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: scaledHeight * 5,
                  ),
                  Text(
                    currentWeatherModel.name,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: textSize * 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.language,
              size: scaledHeight * 15,
              color: Colors.grey,
            ),
            SizedBox(
              height: scaledHeight * 3,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  currentWeatherModel.main.temp.toStringAsFixed(0).toString() +
                      '°C',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: textSize * 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  currentWeatherModel.weather[0].description,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: textSize * 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: scaledHeight * 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ReadingsWidget(
                  textSize: textSize,
                  scaleHeight: scaledHeight,
                  title: 'Humidity',
                  value: '${currentWeatherModel.main.humidity} %',
                ),
                ReadingsWidget(
                  textSize: textSize,
                  scaleHeight: scaledHeight,
                  title: 'Wind',
                  value: '${currentWeatherModel.wind.speed} m/s',
                ),
                ReadingsWidget(
                  textSize: textSize,
                  scaleHeight: scaledHeight,
                  title: 'Pressure',
                  value: '${currentWeatherModel.main.pressure} hPa',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
