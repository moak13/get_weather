import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../viewmodel/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
              body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(model.text),
              SizedBox(
                height: 10,
              ),
              Text(model.data.current.temp.toString())
            ],
          ));
        },
        viewModelBuilder: () => HomeViewModel());
  }
}
