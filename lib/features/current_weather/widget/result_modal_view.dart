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
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: scaledHeight * 30,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.close_rounded),
                  onPressed: onPress,
                  iconSize: scaledWidth * 10,
                  color: Colors.white,
                ),
                SizedBox(
                  height: scaledHeight * 5,
                ),
                Text(
                  currentWeatherModel.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: textSize * 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: scaledHeight * 30,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ReadingsWidget(
                      textSize: textSize,
                      scaleHeight: scaledHeight,
                      title: 'Temperature',
                      value:
                          '${currentWeatherModel.main.temp.toStringAsFixed(0)} °C',
                    ),
                    ReadingsWidget(
                      textSize: textSize,
                      scaleHeight: scaledHeight,
                      title: 'Humidity',
                      value: '${currentWeatherModel.main.humidity} %',
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
        ],
      ),
    );
  }
}
