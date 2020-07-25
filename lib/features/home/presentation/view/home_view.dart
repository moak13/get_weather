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
            body: Center(
              child: Text(model.text),
            ),
          );
        },
        viewModelBuilder: () => HomeViewModel());
  }
}
