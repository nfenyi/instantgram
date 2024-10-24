import 'package:flutter/material.dart';
import 'package:instantgram/extensions/string/as_html_color_to_color.dart';

@immutable
class AppColors {
  static final loginButtonColor = '#cfc9c2'.htmlColorToColor();
  static const loginButtonTextColor = Colors.black;
  static final googleColor = '#42855F4'.htmlColorToColor();
  static final facebookColor = '3b5998'.htmlColorToColor();
  static const Color primary = Colors.blue;

  static const Color primaryNeutral = Color(0xFFE6E7F5);
  static const Color primaryText = Color(0xFF1676F3);
  static const Color secondary = Color(0xFFECB014);
  static const Color secondaryLight = Color(0xFFFFDA7B);
  static const Color tertiary = Color(0xFFFF8B69);
  static const Color success = Color(0xFF15803D);
  static const Color white = Color(0xFFF8F8F8);
  static const Color grey = Color(0xFF747688);
  static const Color lightGrey = Color(0xFFEEEEEE);
  static const Color black = Color(0xFF010033);
  static const Color greenLight = Color(0xFFDBFFDB);
  static const Color neutral100 = Color(0xFFF6F6F7);
  static const Color neutral200 = Color(0xFFE5E7EB);
  static const Color neutral300 = Color(0xFFD1D5DB);
  static const Color neutral500 = Color(0xFF747688);
  static const neutral600 = Color(0xFF4B5563);
  static const neutral800 = Color(0xFF242935);
  static const neutral900 = Color(0xFF111827);

  const AppColors._();
}
