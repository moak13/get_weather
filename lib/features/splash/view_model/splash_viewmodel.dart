import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../locator.dart';
import '../../wrapper/view/wrapper_view.dart';

class SplashViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  _moveToWrapper() {
    _navigationService.navigateToView(
      WrapperView(),
    );
  }

  handleStartupLogic() async {
    final _duration = Duration(seconds: 2);
    Timer(_duration, _moveToWrapper);
  }
}
