
import 'package:weather/weather.dart';

import 'day_night_time_helper.dart';

String getWeatherIcon(String? mainCondition, Weather? weather) {
  if(mainCondition == null) return 'assets/weather_icons/sunny.png';

  switch(mainCondition.toLowerCase()) {
    case 'clouds':
    case 'mist':
    case 'smoke':
    case 'haze':
    case 'dust':
    case 'fog':
      return 'assets/weather_icons/cloudy.png';
    case 'rain':
    case 'drizzle':
    case 'shower rain':
      return 'assets/weather_icons/rainy.png';
    case 'thunderstorm':
      return 'assets/weather_icons/thunder.png';
    case 'clear':
      if(!isDayTime(weather)) {
        return 'assets/weather_icons/night.png';
      }
      return 'assets/weather_icons/sunny.png';
    default:
      if(!isDayTime(weather)) {
        return 'assets/weather_icons/night.png';
      }
      return 'assets/weather_icons/sunny.png';
  }
}