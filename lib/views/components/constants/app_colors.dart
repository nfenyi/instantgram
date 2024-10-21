import 'package:flutter/material.dart';
import 'package:instantgram/extensions/string/as_html_color_to_color.dart';

@immutable
class AppColors {
  static final loginButtonColor = '#cfc9c2'.htmlColorToColor();
  static const loginButtonTextColor = Colors.black;
  static final googleColor = '#42855F4'.htmlColorToColor();
  static final facebookColor = '3b5998'.htmlColorToColor();

  const AppColors._();
}
