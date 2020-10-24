import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ScreenUtil {
  static double _screenWidth;
  static double get screenWidth => _screenWidth;
  static double _screenHeight;
  static double get screenHeight => _screenHeight;
  static double _shortestSide;

  ScreenUtil(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    _shortestSide = MediaQuery.of(context).size.shortestSide;
  }

  // This helps to scale height
  double setHeight({num height = 1}) {
    return (_screenHeight / 100) * height;
  }

  // This helps to scale width
  double setWidth({num width = 1}) {
    return (_screenWidth / 100) * width;
  }

  // This helps to scale texts
  double setSp({num percentage = 1}) {
    return ((_shortestSide) * (percentage / 1000)).ceil().toDouble();
  }
}
