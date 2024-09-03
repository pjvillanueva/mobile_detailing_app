import 'package:geolocator/geolocator.dart';
import 'package:mobile_detailing_app/widgets/utils/constants.dart';

class GeolocatorService {
  GeolocatorService._privateConstructor();

  static final GeolocatorService _instance =
      GeolocatorService._privateConstructor();

  factory GeolocatorService() {
    return _instance;
  }

  Future<Position> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print('Location services are disabled.');
        return defaultPosition;
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
          return defaultPosition;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        print(
            'Location permissions are permanently denied, we cannot request permissions.');
        return defaultPosition;
      }
      return await Geolocator.getCurrentPosition();
    } catch (e) {
      print(e);
      return defaultPosition;
    }
  }
}
