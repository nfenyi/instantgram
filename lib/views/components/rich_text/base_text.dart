import 'package:flutter/material.dart'
    show Colors, TextDecoration, TextStyle, VoidCallback, immutable;
import 'package:instantgram/views/components/rich_text/link_text.dart';

@immutable
class BaseText {
  final String text;
  final TextStyle? style;

  const BaseText({
    required this.text,
    this.style,
  });

  factory BaseText.plain({
    required String text,
    TextStyle? style = const TextStyle(),
  }) =>
      BaseText(text: text, style: style);

  factory BaseText.link({
    required VoidCallback onTapped,
    required String text,
    TextStyle? style = const TextStyle(
      color: Colors.blue,
      decoration: TextDecoration.underline,
    ),
  }) =>
      LinkText(text: text, style: style, onTapped: onTapped);
}
