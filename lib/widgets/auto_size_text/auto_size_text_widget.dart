import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AutoSizeTextWidget extends StatelessWidget {
  AutoSizeTextWidget(
      {Key? key,
      required this.title,
      this.overflow,
      this.maxLines,
      this.textAlign,
      this.style,
      this.minFontSize})
      : super(key: key);

  String title;
  TextStyle? style;
  TextAlign? textAlign;
  int? maxLines;
  double? minFontSize;
  TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
