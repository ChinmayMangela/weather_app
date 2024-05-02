
import 'package:weather/weather.dart';

bool isDayTime(Weather? weather) {
  var currentTime = DateTime.now();
  var sunriseTime = weather?.sunrise;
  var sunsetTime = weather?.sunset;
  return currentTime.isAfter(sunriseTime!) &&
      currentTime.isBefore(sunsetTime!);
}