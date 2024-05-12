import 'dart:async';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/helpers/datetime_helper.dart';
import 'package:weather_app/helpers/weather_icon_helper.dart';
import 'package:weather_app/services/location_service.dart';
import 'package:weather_app/widgets/additional_info_container.dart';
import 'package:weather_app/widgets/background_gradient.dart';
import 'package:weather_app/widgets/build_text.dart';

import '../theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _wf = WeatherFactory(openWeatherAPIKey);
  Weather? _weather;
  String formattedTime = '';
  String formattedDay = '';
  var lightTheme = AppTheme.lightTheme;
  var darkTheme = AppTheme.darkTheme;

  _updateDateNdTime() {
    setState(() {
      formattedTime = DateTimeHelper.getCurrentFormattedTime();
      formattedDay = DateTimeHelper.getCurrentDayAndDate();
    });
  }

  _showTimer() {
    Timer.periodic(
      const Duration(seconds: 60),
      (_) {
        _updateDateNdTime();
      },
    );
  }

  _fetchWeather() async {
    String cityName = await fetchLocation();
    _weather = await _wf.currentWeatherByCityName(cityName);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
    _showTimer();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Scaffold(
      body: _buildUI(brightness),
    );
  }

  Widget _buildUI(Brightness brightness) {
    return _weather == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ThemeSwitchingArea(
            child: Stack(
              children: [
                const BackgroundGradient(),
                Positioned(
                  left: 10.w,
                  top: 40.h,
                  child: _buildLocationWidget(brightness),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BuildText(formattedTime, 27, true),
                      SizedBox(height: 10.h),
                      BuildText(formattedDay, 20, true),
                      SizedBox(height: 30.h),
                      _buildWeatherIcon(),
                      BuildText(
                          _weather!.weatherDescription.toString(), 20.sp, true),
                      SizedBox(height: 20.h),
                      BuildText(
                          '${_weather?.temperature?.celsius?.toStringAsFixed(0)}° C',
                          100.sp,
                          true),
                      SizedBox(height: 20.h),
                      AdditionalInfoContainer(weather: _weather!),
                    ],
                  ),
                )
              ],
            ),
          );
  }

  Widget _buildWeatherIcon() {
    return SizedBox(
      width: 120.w,
      height: 120.h,
      child: Image.asset(
        getWeatherIcon(_weather?.weatherMain, _weather),
      ),
    );
  }

  Widget _buildLocationWidget(Brightness brightness) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.location_on,
          color: brightness == Brightness.light
              ? Colors.red.shade400
              : Colors.red.withOpacity(0.4),
          size: 25.h,
        ),
        BuildText(_weather?.areaName ?? "", 14.sp, true),
        SizedBox(
          width: 180.w,
        ),
        ThemeSwitcher(
            clipper: const ThemeSwitcherCircleClipper(),
            builder: (context) {
          return IconButton(
            onPressed: () {
              var brightness =
                  Theme.of(context).brightness;
              ThemeSwitcher.of(context).changeTheme(
                theme: brightness == Brightness.dark ? lightTheme : darkTheme,
                isReversed: brightness == Brightness.light ? true : false,
              );
            },
            icon: Icon(
              Theme.of(context).brightness ==
                  Brightness.dark
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          );
        })
      ],
    );
  }
}
