import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key, required this.fontSize}) : super(key: key);

  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Picogram',
      style: GoogleFonts.englebert(fontSize: fontSize),
    );
  }
}
