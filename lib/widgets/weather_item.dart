import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherItem extends StatelessWidget {
  const WeatherItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });

  final String imagePath;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Row(
      children: [
        Image.asset(
          imagePath,
          height: 30.h,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildText(title, 12.sp, false, brightness),
            _buildText(subTitle, 15.sp, true, brightness),
          ],
        )
      ],
    );
  }

  Widget _buildText(String text, double fontSize, bool boldFont, Brightness brightness) {
    return Text(
      text,
      style: GoogleFonts.lato(
        fontSize: fontSize,
        color: brightness == Brightness.light ? Colors.black.withOpacity(0.9) : Colors.white.withOpacity(0.4),
        fontWeight: boldFont ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
