import 'package:flutter/material.dart';

class ReadingsWidget extends StatelessWidget {
  final String title;
  final String value;
  final double textSize;
  final double scaleHeight;
  const ReadingsWidget({
    Key key,
    this.title,
    this.value,
    this.textSize,
    this.scaleHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: textSize * 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: scaleHeight * 2,
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.black,
              fontSize: textSize * 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
