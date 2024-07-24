import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color black = Color(0xff212121);
  static const Color black2 = Color(0xff545454);
  static const Color blue1 = Color(0xff2C82AF);
  static const Color blue2 = Color(0xff295772);
  static const Color blue3 = Color(0xff2B607B);
  static const Color blue4 = Color(0xff1D6B94);
  static const Color grey = Color(0xff222939);
  static const Color grey2 = Color(0xff888888);
  static const Color green1 = Color(0xff92CD01);
  static const Color green2 = Color(0xff3AB549);

  static LinearGradient appdGradient = LinearGradient(
    colors: [blue1, blue2],
  );
  static LinearGradient appdGradient2 = LinearGradient(
    colors: [green1, green2],
  );
}
