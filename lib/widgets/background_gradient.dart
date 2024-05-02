import 'package:flutter/material.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final lightColors = [
      Colors.grey.shade300,
      Colors.grey.shade300,
      Colors.white,
    ];
    const darkColors = [
      Color.fromARGB(255, 4, 12, 23),
      Color.fromARGB(255, 4, 12, 47),
      Color.fromARGB(255, 76, 36, 143),
      Color.fromARGB(255, 117, 16, 128),
      Color.fromARGB(255, 155, 2, 175),
    ];
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomRight,
          colors: brightness == Brightness.dark ? darkColors : lightColors,
        ),
      ),
    );
  }
}
