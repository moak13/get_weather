import 'package:flutter/material.dart';

class CurrentWeatherView extends StatelessWidget {
  const CurrentWeatherView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double textScale = MediaQuery.of(context).textScaleFactor;
    double scaleHeight = screenHeight / 100;
    double scaleWidth = screenWidth / 100;
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          SizedBox(
            height: scaleHeight * 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Get to know the weather condition of a place.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: textScale * 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Use the search bar to get started!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: textScale * 20,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
          SizedBox(
            height: scaleHeight * 25,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter City Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: scaleHeight * 4,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: scaleHeight * 7,
              width: scaleWidth * 25,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Center(
                child: Text('Submit'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
