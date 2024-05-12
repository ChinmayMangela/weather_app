import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return ThemeProvider(
          initTheme: AppTheme.lightTheme,
          builder: (p0, theme) => MaterialApp(
            theme: theme,
            darkTheme: AppTheme.darkTheme,
            home: const HomePage(),
          ),
        );
      },
    );
  }
}
