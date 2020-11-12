import 'package:geolocator/geolocator.dart';

class UserCurrentPosition {
  double latitude;
  double longitude;
  UserCurrentPosition({
    this.latitude,
    this.longitude,
  });

  Future getUserCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      UserCurrentPosition userPosition = UserCurrentPosition(
          latitude: position.latitude, longitude: position.longitude);
      print(userPosition.latitude);
      print(userPosition.longitude);
      return userPosition;
    } catch (e) {
      return e.toString();
    }
  }
}
