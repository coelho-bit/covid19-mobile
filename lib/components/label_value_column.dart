import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelValueColumn extends Container {
  static const defaultLabelColor = Color(0xFF7B7B7B);
  static const defaultValueColor = Colors.white;

  LabelValueColumn(
      {String label,
      Color labelColor = defaultLabelColor,
      String value,
      Color valueColor = defaultValueColor})
      : super(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Title(text: label, color: labelColor),
                  Value(text: value, color: valueColor)
                ]));
}

class Title extends Text {
  Title({String text, Color color})
      : super(text, style: GoogleFonts.montserrat(color: color, fontSize: 20.0, letterSpacing: 2.0));
}

class Value extends Text {
  Value({String text, Color color})
      : super(text, style: GoogleFonts.josefinSans(fontSize: 40.0, color: color));
}
