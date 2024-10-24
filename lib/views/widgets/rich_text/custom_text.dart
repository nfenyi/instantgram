import 'package:flutter/material.dart';
import 'package:instantgram/app_constants/app_sizes.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight weight;
  final FontStyle style;
  final TextDecoration decoration;
  final Color? color;
  final TextAlign textAlign;
  final bool softWrap;
  final TextOverflow overflow;
  final int? maxLines;
  final double? height;
  final bool isWhite;
  const CustomText(
      {super.key,
      required this.text,
      this.size = AppSizes.bodySmaller,
      this.weight = FontWeight.w600,
      this.style = FontStyle.normal,
      this.decoration = TextDecoration.none,
      this.color = Colors.black,
      this.textAlign = TextAlign.start,
      this.softWrap = true,
      this.overflow = TextOverflow.clip,
      this.maxLines,
      this.height,
      this.isWhite = false});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        fontStyle: style,
        color: isWhite ? Colors.white : color,
        decoration: decoration,
        decorationColor: color,
        height: height,
      ),
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
