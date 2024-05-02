import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/widgets/weather_item.dart';

class AdditionalInfoContainer extends StatelessWidget {
  const AdditionalInfoContainer({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Container(
      decoration: BoxDecoration(
        color: brightness == Brightness.light ? Colors.white.withOpacity(0.2) : Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10).r,
      width: 280.w,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WeatherItem(
                imagePath: 'assets/weather_icons/sunny.png',
                title: 'Sunrise',
                subTitle: DateFormat('jm').format(weather.sunrise!),
              ),
              WeatherItem(
                imagePath: 'assets/weather_icons/night.png',
                title: 'Sunrise',
                subTitle: DateFormat('jm').format(weather.sunset!),
              ),
            ],
          ),
          Divider(
            thickness: 0.9,
            color: Colors.white.withOpacity(0.05),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WeatherItem(
                imagePath: 'assets/weather_icons/max_temp_thermometer.png',
                title: 'Temp Max',
                subTitle: '${weather.tempMax!.celsius!.toStringAsFixed(0)}° C',
              ),
              WeatherItem(
                imagePath: 'assets/weather_icons/min_temp_thermometer.png',
                title: 'Temp Min',
                subTitle: '${weather.tempMin!.celsius!.toStringAsFixed(0)}° C',
              ),
            ],
          )
        ],
      ),
    );
  }
}
