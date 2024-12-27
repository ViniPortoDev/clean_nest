import 'package:clean_nest/core/themes/theme_text_styles.dart';
import 'package:flutter/material.dart';

/// Use this widget to add text to your components and pages with default theme
class CnTextWidget extends StatelessWidget {
  ///Defines cn text constructor
  const CnTextWidget({
    super.key,
    required this.text,
    this.textStyle,
    this.textAlign = TextAlign.center,
    this.softWrap = true,
    this.maxLines,
  });

  /// defines the text String
  final String text;

  ///defines whether the text should break at soft line breaks.
  final bool softWrap;

  ///defines what is the text style
  final TextStyle? textStyle;

  ///defines the max amount of lines
  final int? maxLines;

  ///defines the text alignment
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    final cnTextStyle = Theme.of(context).extension<CnTextStyles>();

    return Text(
      text,
      style: textStyle ?? cnTextStyle?.textMRegular,
      maxLines: maxLines,
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: TextOverflow.visible,
    );
  }
}
