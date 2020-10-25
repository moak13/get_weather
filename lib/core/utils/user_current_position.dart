import 'package:geolocator/geolocator.dart';

class UserCurrentPosition {
  double latitude;
  double longitude;

  Future<void> getUserCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      return e.toString();
    }
  }
}
