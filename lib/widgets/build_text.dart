import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildText extends StatelessWidget {
  const BuildText(this.text, this.fontSize, this.boldFont, {super.key});

  final String text;
  final double fontSize;
  final bool boldFont;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Text(
      text.toUpperCase(),
      style: GoogleFonts.ptSansNarrow(
        fontSize: fontSize,
        color: brightness == Brightness.light ? Colors.black.withOpacity(0.9) : Colors.white.withOpacity(0.4),
        fontWeight: boldFont ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
