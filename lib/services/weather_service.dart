import 'package:weather/weather.dart';

class WeatherService {
  WeatherService._privateConstructor();

  static final WeatherService _instance = WeatherService._privateConstructor();

  factory WeatherService() {
    return _instance;
  }
  late WeatherFactory weatherFactory;
  
  init() {
    weatherFactory = WeatherFactory("2878f8047b52fc335152d0161aaaad7a");
  }
}
