import 'package:flutter/material.dart';
import 'package:get_weather/core/utils/screen_util.dart';
import 'package:stacked/stacked.dart';

import '../viewmodel/splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            body: Container(
              height: ScreenUtil(context).setHeight(),
              width: ScreenUtil(context).setWidth(),
              child: Center(
                child: Text(model.text),
              ),
            ),
          );
        },
        viewModelBuilder: () => SplashViewModel());
  }
}
