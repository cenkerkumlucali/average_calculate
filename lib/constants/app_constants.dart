import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const MaterialColor primaryColor = Colors.indigo;
  static const String titleText = 'Average Calculate';
  static final TextStyle titleStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: primaryColor);
  static final TextStyle lessonCountStyle = GoogleFonts.quicksand(
      fontSize: 15, fontWeight: FontWeight.w600, color: primaryColor);
  static final TextStyle showAverageStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor);
  static final TextStyle averageStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w800, color: primaryColor);
  static final BorderRadius borderRadius = BorderRadius.circular(16);

  static final EdgeInsetsGeometry dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static final EdgeInsetsGeometry horizontalPadding8 = EdgeInsets.symmetric(horizontal: 8);
}
